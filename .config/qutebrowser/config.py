# General settings
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
config.load_autoconfig(False)
c.auto_save.session = True
c.statusbar.position = "bottom"
c.statusbar.show = "always"
c.url.default_page = "https://qwant.com"
c.url.start_pages = ["https://qwant.com"]
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "rym": "https://rateyourmusic.com/search?searchterm={}",
    "wp": "https://en.wikipedia.org/wiki/{}",
    "gh": "https://github.com/search?q={}",
    "rd": "https://www.reddit.com/search?q={}",
    "py": "https://docs.python.org/3/search.html?q={}",
    "pypi": "https://pypi.org/search/?q={}",
    "go": "https://pkg.go.dev/search?q={}",
    "god": "https://go.dev/search?q={}",
}

### Keybindings 
# reverse J and K for tab switching
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('<Alt-r>', 'config-source')
config.bind('<Alt-e>', 'config-edit')

# Privacy settings
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
# these may break workflow
c.content.canvas_reading = False
c.content.webgl = False
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"

# source theme from designated file
config.source('tokyonight_theme.py')
