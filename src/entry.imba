const pages = import.meta.glob("./pages/*.imba", {eager: true, import: 'default'})

def clean_path(path\string)
	# remove ./pages prefix, file extension and replace /index with /
	return path
		.replace(/^\.\/pages/, "")
		.replace(/\.[^\.]+$/, "")
		.replace(/(?:\/index)+(\/|$)/g, "/")

tag App
	<self>
		<nav[d:vflex]>
			for own path of pages
				<a route-to=clean_path(path)> clean_path(path)
		for own path, fn of pages
			<div route=clean_path(path)>
				fn!

imba.mount <App>