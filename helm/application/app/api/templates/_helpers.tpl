{{- define "api-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Values.environment.active -}}
{{- end }}
