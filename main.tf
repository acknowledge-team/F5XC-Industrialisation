
resource "volterra_app_firewall" "waf1" {

name                     = "ara-acmecorp-waf1"
// --- Labels = {KeyName = Value}
labels = { 
   label-name = "value"
  }
namespace                = var.f5_xc_namespace
description              = "Politique WAF 01"
blocking                     = true

# default_detection_settings = true

detection_settings {
  signature_selection_setting {
#     default_attack_type_settings = true   
      attack_type_settings { 
         disabled_attack_types = ["ATTACK_TYPE_AUTHENTICATION_AUTHORIZATION_ATTACKS","ATTACK_TYPE_COMMAND_EXECUTION"]
        }
	    high_medium_low_accuracy_signatures = true 
    }

// --- Automatic Attack Signautres Tuning
enable_suppression= true 

// --- Attack Signature Staging
disable_staging=true

enable_threat_campaigns = true
#disable_threat_campaigns=true

#default_violation_settings = true

violation_settings {
  disabled_violation_types = ["VIOL_EVASION_BARE_BYTE_DECODING","VIOL_HTTP_PROTOCOL_CONTENT_LENGTH_SHOULD_BE_A_POSITIVE_NUMBER"]
 } 

} // end detection_Setting
// --- Bot Setting
// --- > One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
#default_bot_setting = true
 
// Custom setting and value : REPORT / BLOCK / IGNORE
bot_protection_setting {
  good_bot_action         = "REPORT"
  malicious_bot_action    = "BLOCK"
  suspicious_bot_action   = "IGNORE"
 }

allow_all_response_codes = true

#allowed_response_codes { 
#  response_code = [200,201,202,203,204,205,206,300,301,302,303,304,308,307,400,401,403,404,407,429,500,501,502,503]
# }

default_anonymization  = true
use_default_blocking_page = true

// --- Blocking_page = "string:///BASE-64-OF-YOUR-CODE-HTML"
// SAMPLE HTML CODE = <title>Request Rejected</title></head><body>The requested URL was rejected. Please consult with your administrator.<br/><br/>Your support ID is: {{request_id}}<br/><br/><a href="javascript:history.back()">[Go Back]</a></body></html>
// SAMPLE BASE64 = PHRpdGxlPlJlcXVlc3QgUmVqZWN0ZWQ8L3RpdGxlPjwvaGVhZD48Ym9keT5UaGUgcmVxdWVzdGVkIFVSTCB3YXMgcmVqZWN0ZWQuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLjxici8+PGJyLz5Zb3VyIHN1cHBvcnQgSUQgaXM6IHt7cmVxdWVzdF9pZH19PGJyLz48YnIvPjxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT48L2JvZHk+PC9odG1sPg==
// /!\ Response body can't exceed 4 KB in size.

#blocking_page {
#  response_code = "OK"
#  blocking_page = "string:///PHRpdGxlPlJlcXVlc3QgUmVqZWN0ZWQ8L3RpdGxlPjwvaGVhZD48Ym9keT5UaGUgcmVxdWVzdGVkIFVSTCB3YXMgcmVqZWN0ZWQuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLjxici8+PGJyLz5Zb3VyIHN1cHBvcnQgSUQgaXM6IHt7cmVxdWVzdF9pZH19PGJyLz48YnIvPjxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT48L2JvZHk+PC9odG1sPg=="
#}

}
