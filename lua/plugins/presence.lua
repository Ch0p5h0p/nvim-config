local do_we_have_personality = true

local function choose_text(default, options)
    if not do_we_have_personality then
        return default
    end

    return function(...)
        return options[math.random(#options)]:format(...)
    end
end

local text_sets = {
    image_text = {
        "The editor of all time",
        "Why are you looking at the image text lol",
        "Wait this isn't Titanfall 2...",
    },
    editing_text = {
        "Editing %s",
        "Messing with %s",
        "Tweaking %s",
        "Changing %s",
        "Rewriting %s",
        "Poking at %s",
        "Giving %s some love",
        "Making %s go faster",
        "Applying Stim to %s",
        "Protecting %s (Protocol 3)",
        "Taking %s to the Frontier",
        "Equipping %s with a Mastiff",
        "Giving %s a fresh coat of paint",
    },
    file_explorer_text = {
        "Browsing %s",
        "Exploring %s",
        "Searching through %s",
        "Wallrunning through %s",
        "Navigating %s",
        "Looking for BT in %s",
        "Searching the Frontier: %s",
        "Infiltrating %s",
    },
    git_commit_text = {
        "Committing changes",
        "Sending it to the Frontier",
        "Securing the 6-4",
        "Deploying a new build",
        "Leaving a message for BT",
        "Another successful mission",
        "Making history, one commit at a time",
        "Trust me, it works",
        "No going back now, pilot",
    },
    plugin_manager_text = {
        "Managing plugins",
        "Equipping new abilities",
        "Configuring the loadout",
        "Installing Frontier technology",
        "Upgrading the chassis",
        "Modifying the simulation",
        "Acquiring new equipment",
        "Optimizing the pilot kit",
        "Unlocking new capabilities",
    },
    reading_text = {
        "Reading %s",
        "Looking through %s",
        "Browsing %s",
        "Checking out %s",
        "Taking a look at %s",
        "Going through %s",
        "Having a peek at %s",
        "Admiring %s",
        "Consulting %s",
        "Looking for BT in %s",
        "Checking %s for hostile activity",
        "Downloading %s from the Frontier",
        "Studying the pilot's manual: %s",
        "Wondering what's inside %s",
    },
    workspace_text = {
        "Working on %s",
        "Deploying to %s",
        "Operating in %s",
        "Preparing %s for Titanfall",
        "Setting up shop in %s",
        "Taking the fight to %s",
        "Making %s a better place",
        "Establishing a foothold in %s",
    },
}

return {
    "andweeb/presence.nvim",
    enabled = true,
    opts = {},
    config = function(opts)
        require("presence").setup({
            auto_update         = true,
            neovim_image_text   = "Why are you looking at the image text lol",
            main_image          = "neovim",
            log_level           = nil,
            debounce_timeout    = 10,
            enable_line_number  = false,
            blacklist           = {},
            buttons             = true,
            file_assets         = {},
            show_time           = true,

            editing_text        = choose_text("Editing %s", text_sets.editing_text),
            file_explorer_text  = choose_text("Browsing %s", text_sets.file_explorer_text),
            git_commit_text     = choose_text("Committing changes", text_sets.git_commit_text),
            plugin_manager_text = choose_text("Managing plugins", text_sets.plugin_manager_text),
            reading_text        = choose_text("Reading %s", text_sets.reading_text),
            workspace_text      = choose_text("Working on %s",  text_sets.workspace_text),
            line_number_text    = "Line %s out of %s",
        })
    end,
}
