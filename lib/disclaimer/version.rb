module Disclaimer
  VERSION = "0.1.0"
end

# History
#
# 0.1.0 - Moves app to beta
# -------------------------
# Makes app ready for beta release
#
# 0.0.7 - Fixes redirect when app hosted in sub uri
# -------------------------------------------------
# Version 0.0.6 fixed the redirect to the disclaimer page, but the return from
# the disclaimer to the app was still broken if there was no return path in
# session (for example, if someone went straight to the disclaimer path).
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
