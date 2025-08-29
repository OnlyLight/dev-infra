import http from "k6/http";
import { sleep } from "k6";

export const options = {
  thresholds: {
    /**
     * defined service level objectives (SLOs). For example:
        99% of requests should be successful
        99% of requests should have a latency of 1000ms or less
     */
    http_req_failed: [{ threshold: "rate<0.01" }],
    http_req_duration: ["p(99)<1000"],
  },
  scenarios: {
    // define scenarios
    average_load: {
      executor: "ramping-vus",
      stages: [
        // ramp up to average load of 20 virtual users
        { duration: "10s", target: 20 },
        { duration: "50s", target: 20 },
        { duration: "50s", target: 40 },
        { duration: "50s", target: 60 },
        { duration: "50s", target: 80 },
        { duration: "50s", target: 100 },
        { duration: "50s", target: 120 },
        { duration: "50s", target: 140 },
      ],
    },
  },
};

export default function () {
  const res = http.get("http://localhost:3000/posts");

  // check that response is 200
  check(res, {
    "response code was 200": (res) => res.status == 200,
  });

  sleep(0.5);
}
