parameters:
  - name: telemetryPipelineId
    type: number
  - name: organization
    type: string
  - name: project
    type: string

jobs:
- job: TriggerTelemetry
  displayName: Trigger Telemetry Pipeline
  steps:
    - script: |
        echo "Triggering Telemetry Pipeline..."

        ORG="${{ parameters.organization }}"
        PROJECT="${{ parameters.project }}"
        PIPELINE_ID=${{ parameters.telemetryPipelineId }}

        echo "Pipeline ID: $PIPELINE_ID"
        echo "Organization: $ORG"
        echo "Project: $PROJECT"

        API_URL="https://dev.azure.com/$ORG/$PROJECT/_apis/pipelines/$PIPELINE_ID/runs?api-version=7.0"

        JSON='{
          "resources": {
            "repositories": {
              "self": {
                "refName": "'"${BUILD_SOURCEBRANCH}"'"
              }
            }
          }
        }'

        echo "Payload:"
        echo "$JSON"

        echo "Calling API: $API_URL"
        curl -X POST "$API_URL" \
          -H "Content-Type: application/json" \
          -H "Authorization: Bearer $SYSTEM_ACCESSTOKEN" \
          -d "$JSON"
      env:
        SYSTEM_ACCESSTOKEN: $(System.AccessToken)
      displayName: Invoke Telemetry via REST API
