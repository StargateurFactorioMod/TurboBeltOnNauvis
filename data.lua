local turbo_transport_belt = data.raw["technology"]["turbo-transport-belt"]

data:extend({
  {
    type = "technology",
    name = "turbo-transport-belt-uranium-238",
    localised_name = { "",
      turbo_transport_belt.localised_name or { string.format("technology-name.%s", turbo_transport_belt.name) },
      " ", { "item-name.uranium-238" },
    },
    localised_description = { "technology-description.turbo-transport-belt-uranium-238", { "item-name.uranium-238" } },
    effects = {},
    icons = {
      {
        icon = "__space-age__/graphics/technology/turbo-transport-belt.png",
        icon_size = 256,
      },
      {
        icon = "__base__/graphics/icons/uranium-238.png",
        icon_size = 64,
        scale = 1,
        shift = { 32, 32 },
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
