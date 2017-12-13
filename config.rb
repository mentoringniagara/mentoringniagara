# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, apply_css_live: false, apply_js_live: false
end

activate :meta_tags

# Build-specific configuration
configure :build do

  activate :robots,
            rules: [{ user_agent: '*', allow: %w[/] }]

  # Minify CSS on build
  activate :minify_css

  # Minify HTML on view
  activate :minify_html

  # Minify Javascript on build
  activate :minify_javascript

  activate :gzip

  after_build do |builder|
    FileUtils.cp_r 'public/.', 'build'
  end

end