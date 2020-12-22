{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cate-webui.labels" -}}
helm.sh/chart: {{ include "cate.chart" . }}
{{ include "cate-webui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "cate-webui.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.webui.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*xcube-hub*/}}

{{/*
Common labels
*/}}
{{- define "xcubehub.labels" -}}
helm.sh/chart: {{ include "cate.chart" . }}
{{ include "xcubehub.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "xcubehub.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.xcubehub.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

