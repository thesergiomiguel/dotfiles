return {
  'chrisgrieser/nvim-various-textobjs',
  config = function()
    vim.keymap.set({ 'x', 'o' }, 'is', '<cmd>lua require("various-textobjs").subword("inner")<cr>')
    vim.keymap.set({ 'x', 'o' }, 'as', '<cmd>lua require("various-textobjs").subword("outer")<cr>')

    require('various-textobjs').setup {
      useDefaultKeymaps = true,
      disabledKeymaps = {
        'iS',
        'aS',

        --- subWord: 'iS', 'aS',
        --- ^ overwritten to is/as

        --- anyQuote: 'iq', 'aq',
        --- lastChange: 'g;',
        --- cssColor: 'i#', 'a#',
        --- htmlAttribute: 'ix', 'ax'

        --- No real use case for now, leave disabled.
        'ii',
        'ai',
        'iI',
        'aI',
        'R',
        'ag',
        'ig',

        'C',
        'Q',

        'io',
        'ao',
        'r',
        'gG',
        'i_',
        'a_',
        '|',
        'iz',
        'az',
        'im',
        'am',
        'gw',
        'gW',

        'il',
        'al',
        'ie',
        'ae',
        'iC',
        'aC',
        'ic',
        'ac',

        'iD',
        'aD',
        'iP',
        'aP',
        'iy',
        'ay',
        'iN',
        'aN',
      },
    }
  end,
}
