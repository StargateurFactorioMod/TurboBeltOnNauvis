local uranium_recipes = {}

local function find_item(entity_name)
  for _, item in pairs(data.raw["item"]) do
    if item.name == entity_name then
      return item
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
  "splitter",
  "loader",
  "lane%-splitter",
}

for _, recipe in pairs(data.raw["recipe"]) do
  if recipe.results and recipe.results[1] then
    local item = table.deepcopy(find_item(recipe.results[1].name))
    if item and recipe.name:find("turbo") and recipe.category ~= "recycling" and any_of(words, recipe.name) then
      log(serpent.block(item))
      local uranium_recipe = table.deepcopy(recipe)
      local find_tungsten_plate = false
      for _, ingredients in ipairs(uranium_recipe.ingredients) do
        if ingredients.name == "tungsten-plate" then
          ingredients.name = "uranium-238"
          find_tungsten_plate = true
          break
        end
      end
      if find_tungsten_plate then
        uranium_recipe.localised_name = { "",
          recipe.localised_name or { string.format("entity-name.%s", item.name) },
          " ", { "item-name.uranium-238" },
        }
        uranium_recipe.name = uranium_recipe.name .. "-uranium-238"
        uranium_recipe.category = "crafting-with-fluid-or-metallurgy"
        uranium_recipe.surface_conditions = nil

        local icons = item.icons or {}
        if item.icon then
          icons = { { icon = item.icon, icon_size = item.icon_site } }
        end
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
  end
end

data:extend(uranium_recipes)
