inputs:
  targetType: 'inline'
  script: |
    $headers = @{
      Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"
      "Content-Type" = "application/json"
    }

    $body = @{
      resources = @{
        repositories = @{
          self = @{
            refName = "$(Build.SourceBranch)"
          }
        }
      }
    } | ConvertTo-Json -Depth 10

    $runUrl = "https://dev.azure.com/ORG_NAME/PROJECT_NAME/_apis/pipelines/PIPELINE_ID/runs?api-version=7.0"

    try {
      Write-Host "Triggering pipeline at URL: $runUrl"
      $response = Invoke-RestMethod -Uri $runUrl -Method POST -Headers $headers -Body $body
      Write-Host "Pipeline triggered successfully:"
      Write-Host ($response | ConvertTo-Json -Depth 5)
    } catch {
      Write-Host "❌ Error triggering pipeline"
      Write-Host $_.Exception.Message
      Write-Host $_.Exception.Response
      $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
      $reader.BaseStream.Position = 0
      $reader.DiscardBufferedData()
      $responseBody = $reader.ReadToEnd()
      Write-Host "Response Body:"
      Write-Host $responseBody
    }
