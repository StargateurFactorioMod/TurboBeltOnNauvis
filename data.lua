data:extend({
  {
    type = "recipe",
    name = "turbo-transport-belt-uranium",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
      { type = "item",  name = "uranium-238",            amount = 5 },
      { type = "item",  name = "express-transport-belt", amount = 1 },
      { type = "fluid", name = "lubricant",              amount = 20 }
    },
    results = { { type = "item", name = "turbo-transport-belt", amount = 1 } }
  },
  {
    type = "recipe",
    name = "turbo-underground-belt-uranium",
    category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      { type = "item",  name = "uranium-238",              amount = 40 },
      { type = "item",  name = "express-underground-belt", amount = 2 },
      { type = "fluid", name = "lubricant",                amount = 40 }
    },
    results = { { type = "item", name = "turbo-underground-belt", amount = 2 } }
  },
  {
    type = "recipe",
    name = "turbo-splitter-uranium",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      { type = "item",  name = "express-splitter", amount = 1 },
      { type = "item",  name = "uranium-238",      amount = 15 },
      { type = "item",  name = "processing-unit",  amount = 2 },
      { type = "fluid", name = "lubricant",        amount = 80 }
    },
    results = { { type = "item", name = "turbo-splitter", amount = 1 } }
  },
  {
    type = "recipe",
    name = "turbo-loader-uranium",
    enabled = false,
    hidden = true,
    energy_required = 20,
    ingredients =
    {
      { type = "item", name = "turbo-transport-belt", amount = 5 },
      { type = "item", name = "express-loader",       amount = 1 }
    },
    results = { { type = "item", name = "turbo-loader", amount = 1 } }
  },
  {
    type = "technology",
    name = "turbo-transport-belt-uranium",
    icon = "__space-age__/graphics/technology/turbo-transport-belt.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "turbo-transport-belt-uranium"
      },
      {
        type = "unlock-recipe",
        recipe = "turbo-underground-belt-uranium"
      },
      {
        type = "unlock-recipe",
        recipe = "turbo-splitter-uranium"
      },
    },
    prerequisites = { "utility-science-pack", "logistics-3", "uranium-processing" },
    unit =
    {
      count = 500,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "utility-science-pack",    1 }
      },
      time = 60
    }
  }
})

if mods["aai-loaders"] then
  data:extend({ {
    type = "recipe",
    category = "crafting-with-fluid",
    name = "turbo-transport-belt-loader-uranium",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      { type = "item",  name = "aai-express-loader", amount = 1 },
      { type = "item",  name = "uranium-238",        amount = 30 },
      { type = "item",  name = "processing-unit",    amount = 4 },
      { type = "fluid", name = "lubricant",          amount = 160 }
    },
    results = { { type = "item", name = "turbo-transport-belt-loader", amount = 1 } }
  } })

  table.insert(data.raw.technology["turbo-transport-belt-uranium"].effects, {
    type = "unlock-recipe",
    recipe = "turbo-transport-belt-loader-uranium"
  })
end

if mods["deadlock-beltboxes-loaders"] then
  data:extend({{
    type = "recipe",
    category = "crafting-with-fluid",
    name = "turbo-transport-belt-loader-uranium",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      { name = "express-transport-belt-loader", type = "item",  amount = 1 },
      { name = "uranium-238",                   type = "item",  amount = 20 },
      { name = "lubricant",                     type = "fluid", amount = 20 },
    },
    results = { { type = "item", name = "turbo-transport-belt-loader", amount = 1 } }
  },
    -- {
    --   type = "recipe",
    --   category = "crafting-with-fluid",
    --   name = "turbo-transport-belt-beltbox-uranium",
    --   enabled = false,
    --   energy_required = 2,
    --   ingredients =
    --   {
    --     { name = "express-transport-belt-beltbox", type = "item",  amount = 1 },
    --     { name = "uranium-238",                    type = "item",  amount = 15 },
    --     { name = "iron-gear-wheel",                type = "item",  amount = 15 },
    --     { name = "lubricant",                      type = "fluid", amount = 100 },
    --   },
    --   results = { { type = "item", name = "turbo-transport-belt-loader-uranium", amount = 1 } }
    -- },
  })
  table.insert(data.raw.technology["turbo-transport-belt-uranium"].effects, {
    type = "unlock-recipe",
    recipe = "turbo-transport-belt-loader-uranium"
  })
  -- table.insert(data.raw.technology["deadlock-stacking-4"].effects, {
  --   type = "unlock-recipe",
  --   recipe = "turbo-transport-belt-beltbox-uranium"
  -- })
end
