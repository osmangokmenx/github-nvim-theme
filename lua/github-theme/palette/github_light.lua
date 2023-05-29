local C = require('github-theme.lib.color')

local meta = {
  name = 'github_light',
  light = true,
}

local primitives =
  require('github-theme.palette.primitives.' .. meta.name:gsub('^github%W*', '', 1))

local pl = primitives.prettylights

---Github Light scale variables
---source: https://github.com/primer/primitives/blob/main/data/colors/themes/light.ts
-- stylua: ignore
local scale = {
  black = '#1F2328',
  white = '#ffffff',
  gray = {
    '#f6f8fa', '#eaeef2', '#d0d7de', '#afb8c1', '#8c959f',
    '#6e7781', '#57606a', '#424a53', '#32383f', '#24292f',
  },
  blue = {
    '#ddf4ff', '#b6e3ff', '#80ccff', '#54aeff', '#218bff',
    '#0969da', '#0550ae', '#033d8b', '#0a3069', '#002155'
  },
  green = {
    '#dafbe1', '#aceebb', '#6fdd8b', '#4ac26b', '#2da44e',
    '#1a7f37', '#116329', '#044f1e', '#003d16', '#002d11'
  },
  yellow = {
    '#fff8c5', '#fae17d', '#eac54f', '#d4a72c', '#bf8700',
    '#9a6700', '#7d4e00', '#633c01', '#4d2d00', '#3b2300',
  },
  orange = {
    '#fff1e5', '#ffd8b5', '#ffb77c', '#fb8f44', '#e16f24',
    '#bc4c00', '#953800', '#762c00', '#5c2200', '#471700',
  },
  red = {
    '#ffebe9', '#ffcecb', '#ffaba8', '#ff8182', '#fa4549',
    '#cf222e', '#a40e26', '#82071e', '#660018', '#4c0014'
  },
  purple = {
    '#fbefff', '#ecd8ff', '#d8b9ff', '#c297ff', '#a475f9',
    '#8250df', '#6639ba', '#512a97', '#3e1f79', '#2e1461',
  },
  pink = {
    '#ffeff7', '#ffd3eb', '#ffadda', '#ff80c8', '#e85aad',
    '#bf3989', '#99286e', '#772057', '#611347', '#4d0336'
  },
  coral = {
    '#fff0eb', '#ffd6cc', '#ffb4a1', '#fd8c73', '#ec6547',
    '#c4432b', '#9e2f1c', '#801f0f', '#691105', '#510901',
  },
}

C.WHITE = C(scale.white)
C.BLACK = C(scale.black)
C.BG = C(scale.white)

local function alpha(color, a)
  return color:alpha_blend(a):to_css()
end

-- Temp override until Primitives are updated
local palette = {
  scale = scale,

  orange = scale.orange[4],
  gray = scale.gray[6],

  black = { base = scale.gray[10], bright = scale.gray[7] },
  white = { base = scale.gray[6], bright = scale.gray[5] },
  red = { base = scale.red[6], bright = scale.red[7] },
  green = { base = scale.green[7], bright = scale.green[6] },
  yellow = { base = scale.yellow[9], bright = scale.yellow[8] },
  blue = { base = scale.blue[6], bright = scale.blue[5] },
  magenta = { base = scale.purple[6], bright = scale.purple[5] },
  pink = { base = scale.pink[6], bright = scale.pink[5] },
  cyan = { base = '#1b7c83', bright = '#3192aa' },

  fg = {
    default = scale.black,
    muted = scale.gray[3],
    subtle = scale.gray[6],
    on_emphasis = scale.white,
  },

  canvas = {
    default = scale.white,
    overlay = scale.white,
    inset = scale.gray[1],
    subtle = scale.gray[1],
  },

  border = {
    default = scale.gray[3],
    muted = C(scale.gray[3]):lighten(0.03), -- TODO: lighten method not working
    subtle = alpha(C(scale.black), 0.15),
  },

  neutral = {
    emphasis_plus = scale.gray[10],
    emphasis = scale.gray[6],
    muted = alpha(C(scale.gray[4]), 0.2),
    subtle = alpha(C(scale.gray[2]), 0.5),
  },

  accent = {
    fg = scale.blue[6],
    emphasis = scale.blue[6],
    muted = alpha(C(scale.blue[4]), 0.4),
    subtle = scale.blue[1],
  },

  success = {
    fg = scale.green[6],
    emphasis = '#1f883d',
    muted = alpha(C(scale.green[4]), 0.4),
    subtle = scale.green[1],
  },

  attention = {
    fg = scale.yellow[6],
    emphasis = scale.yellow[6],
    muted = alpha(C(scale.yellow[4]), 0.4),
    subtle = scale.yellow[1],
  },

  severe = {
    fg = scale.orange[6],
    emphasis = scale.orange[6],
    muted = alpha(C(scale.orange[4]), 0.4),
    subtle = scale.orange[1],
  },

  danger = {
    fg = '#d1242f',
    emphasis = scale.red[6],
    muted = alpha(C(scale.red[4]), 0.4),
    subtle = scale.red[1],
  },

  open = {
    fg = scale.green[6],
    emphasis = '#1f883d',
    muted = alpha(C(scale.green[4]), 0.4),
    subtle = scale.green[1],
  },

  closed = {
    fg = '#d1242f',
    emphasis = scale.red[6],
    muted = alpha(C(scale.red[4]), 0.4),
    subtle = scale.red[1],
  },

  done = {
    fg = scale.purple[6],
    emphasis = scale.purple[6],
    muted = alpha(C(scale.purple[4]), 0.4),
    subtle = scale.purple[1],
  },

  sponsors = {
    fg = scale.pink[6],
    emphasis = scale.pink[6],
    muted = alpha(C(scale.pink[4]), 0.4),
    subtle = scale.pink[1],
  },
}

local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.canvas.inset,                            -- Dark bg (popup and float)
    bg1  = pal.canvas.default,                          -- Default bg
    bg2  = alpha(C(pal.neutral.emphasis), 0.1),         -- Lighter bg (colorcolumn Folds)
    bg3  = alpha(C(pal.scale.blue[9]), 0.1),            -- Lighter bg (cursor line)
    bg4  = pal.scale.gray[6],                           -- Conceal

    fg0  = pal.fg.subtle,                               -- Lighter fg
    fg1  = pal.fg.default,                              -- Default fg
    fg2  = pal.scale.gray[9],                           -- Darker fg (status line)
    fg3  = pal.scale.gray[7],                           -- Darker fg (line numbers, fold columns)

    sel0 = alpha(C(pal.accent.fg), 0.15),               -- Visual selection bg
    sel1 = alpha(C(pal.accent.muted), 0.90),            -- Popup sel bg
    sel2 = alpha(C(pal.attention.emphasis), 0.3)        -- Search bg
  }

  spec.syntax = {
    bracket     = spec.fg1,                             -- Brackets and Punctuation
    builtin0    = pl.syntax.constant,                   -- Builtin variable
    builtin1    = pl.syntax.keyword,                    -- Builtin type
    builtin2    = pl.syntax.constant,                   -- Builtin const
    comment     = pl.syntax.comment,                    -- Comment
    conditional = pl.syntax.keyword,                    -- Conditional and loop
    const       = pl.syntax.constant,                   -- Constants, imports and booleans
    dep         = pal.scale.red[8],                     -- Deprecated
    field       = pl.syntax.constant,                   -- Field
    func        = pl.syntax.entity,                     -- Functions and Titles
    ident       = spec.fg1,                             -- Identifiers
    keyword     = pl.syntax.keyword,                    -- Keywords
    number      = pl.syntax.constant,                   -- Numbers
    operator    = pl.syntax.constant,                   -- Operators
    param       = spec.fg1,                             -- Parameters
    preproc     = pl.syntax.keyword,                    -- PreProc
    regex       = pl.syntax.string,                     -- Regex
    statement   = pl.syntax.keyword,                    -- Statements
    string      = pl.syntax.string,                     -- Strings
    type        = pl.syntax.variable,                   -- Types
    tag         = pl.syntax.entityTag,                  -- Tags
    variable    = spec.fg1,                             -- Variables
  }

  spec.diag = {
    error = pal.danger.fg,
    warn  = pal.attention.fg,
    info  = pal.accent.fg,
    hint  = pal.fg.muted,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.15):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.15):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.15):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.15):to_css(),
  }

  spec.diff = {
    add    = alpha(C(pal.scale.green[7]), 0.3),
    delete = alpha(C(pal.scale.red[7]), 0.3),
    change = alpha(C(pal.scale.yellow[7]), 0.3),
    text   = spec.fg0
  }

  spec.git = {
    add      = pal.success.fg,
    removed  = pal.danger.fg,
    changed  = pal.attention.fg,
    conflict = pal.severe.fg,
    ignored  = pal.fg.subtle,
  }

  -- stylua: ignore end
  return spec
end

return {
  meta = meta,
  primitives = primitives,
  palette = palette,
  generate_spec = generate_spec,
}
