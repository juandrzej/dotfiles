# General settings
config.load_autoconfig(False)
c.auto_save.session = True
c.statusbar.position = "bottom"
c.statusbar.show = "always"
c.url.default_page = "https://qwant.com"
c.url.start_pages = ["https://qwant.com"]
c.url.searchengines = {
    "DEFAULT": "https://qwant.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "rym": "https://rateyourmusic.com/search?searchterm={}",
}

### Keybindings 
# reverse J and K for tab switching
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Privacy settings
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
# these may break workflow
# c.content.canvas_reading = False
# c.content.webgl = False
# c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0"

# source theme from designated file
config.source('tokyonight_theme.py')
