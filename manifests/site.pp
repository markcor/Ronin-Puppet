node default {
	include roles::geckotwin1064
}

# hardware
node /^t-w1064.*\.(wintest|test)\.releng\.(mdc*)\.mozilla.com$/ {
	include roles::geckotwin1064hw
}
