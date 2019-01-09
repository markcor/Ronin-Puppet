node default {
	include roles::geckotwin1064
}

# hardware
node /^t-w1064-ms-\d+\.wintest\.releng\.mdc(1|2)\.mozilla.com/ {
	include roles::geckotwin1064hw
}
