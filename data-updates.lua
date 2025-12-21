local uranium_recipes = {}

local function find_item(entity_name)
  for _, type in pairs(data.raw) do
    for _, item in pairs(type) do
      if item.name == entity_name then
        return item
      end
    end
  end
end


---@param words string[]
---@param x string
local function any_of(words, x)
  for _, word in ipairs(words) do
    if x:find(word) then
      return word
    end
  end
end

local words = {
  "belt",
  "underground",
  "spliter",
  "loader",
}

for _, recipe in pairs(data.raw["recipe"]) do
  local item = table.deepcopy(find_item(recipe.name))
  if item and recipe.name:find("turbo") and recipe.category ~= "recycling" and any_of(words, recipe.name) then
    local uranium_recipe = table.deepcopy(recipe)
    for _, ingredients in ipairs(uranium_recipe.ingredients) do
      if ingredients.name == "tungsten-plate" then
        ingredients.name = "uranium-238"
        break
      end
    end
    uranium_recipe.localised_name = { "",
      recipe.localised_name or { string.format("entity-name.%s", uranium_recipe.name) },
      " ", { "item-name.uranium-238" },
    }
    uranium_recipe.name = uranium_recipe.name .. "-uranium-238"
    uranium_recipe.category = "crafting-with-fluid-or-metallurgy"
    uranium_recipe.surface_conditions = nil

    local icons = item.icons or { { icon = item.icon, icon_size = item.icon_size } }
    table.insert(icons, {
      icon = "__base__/graphics/icons/uranium-238.png",
      icon_size = 64,
      scale = 1 / 4,
      shift = { 8, 8 },
    })
    uranium_recipe.icons = icons
    table.insert(data.raw.technology["turbo-transport-belt-uranium-238"].effects, {
      type = "unlock-recipe",
      recipe = uranium_recipe.name,
    })
    table.insert(uranium_recipes, uranium_recipe)
  end
end

data:extend(uranium_recipes)
