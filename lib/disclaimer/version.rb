module Disclaimer
  VERSION = "0.0.6"
end

# History
# 
# 0.0.6 - Improves redirect mechanism
# -----------------------------------
# Uses host apps root path to determine redirect path. This allows modifications
# to the route caused by the app being mounted in a sub uri, to be taken account
# of in the redirect url.
# 
# 0.0.5 - Bug fix
# ---------------
# Defaults to '/' if no previous route found
# 
# 0.0.4 - Improvement
# -------------------
# Improves handling of instance where Disclaimer::Document not found
# 
# 0.0.3 - Release prior to recording history
# ------------------------------------------
# Working version
#
