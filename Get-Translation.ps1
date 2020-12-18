function Get-Translation {
  param (
    [string]$TargetLanguage,
    [string]$InputText
  )
  $apiKey = "<ENTER_YOUR_API_KEY_HERE>"
  $translateBaseURI = "https://api.cognitive.microsofttranslator.com/translate?api-version=3.0"
  $fromLang = "en"
  $headers = @{}
  $headers.Add("Ocp-Apim-Subscription-Key", $apiKey)
  $headers.Add("Content-Type", "application/json")
  $headers.Add("Ocp-Apim-Subscription-Region", "westeurope")
  $convertURI = "$($translateBaseURI)&from=$($fromLang)&to=$($TargetLanguage)"
  $text = @{'Text' = $($InputText) }
  $text = $text | ConvertTo-Json
  $conversionResult = Invoke-RestMethod -Method POST -Uri $convertURI -Headers $headers -Body "[$($text)]"
  $conversionResult.translations[0].text
}
