yml =
	development:
		API_URL: "http://docker:3000"
	production:
		API_URL: "http://ccbonline.herokuapp.com"

if window.location.host.indexOf("localhost") > -1 or
window.location.host.indexOf("docker") > -1 or
window.location.host.indexOf("127") > -1
	env = "development"
else
	env = "production"

angular
	.module 'CCBApp'
	.constant 'CONSTANTS' ,
		API_URL: yml[env].API_URL