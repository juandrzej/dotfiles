# General settings
config.load_autoconfig(False)
c.auto_save.session = True
c.statusbar.position = "bottom"
c.statusbar.show = "always"
c.url.default_page = "https://qwant.com"
c.url.start_pages = ["https://qwant.com"]

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://qwant.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "y": "https://www.youtube.com/results?search_query={}"
}

# Keybindings - reverse J and K for tab switching
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Theme
config.source('tokyonight_theme.py')
