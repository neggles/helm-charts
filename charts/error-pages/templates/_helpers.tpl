{{/*
Expand the name of the chart.
*/}}
{{- define "error-pages.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "error-pages.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "error-pages.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "error-pages.labels" -}}
helm.sh/chart: {{ include "error-pages.chart" . }}
{{ include "error-pages.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "error-pages.selectorLabels" -}}
app.kubernetes.io/name: {{ include "error-pages.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Choose livenessProbe and readinessProbe type depending on whether our defaultHttpCode is a 2xx or 4xx/5xx
*/}}
{{- define "error-pages.deploymentProbe" -}}
{{- with $code := atoi .Values.errorPages.defaultHttpCode }}
{{- if and (lt $code 400) (ge $code 200) }}
httpGet:
  path: "/{{ .Values.errorPages.defaultHttpCode }}.html"
  port: http
{{- else }}
tcpSocket:
  port: http
{{- end }}
{{- end }}
{{- end }}
