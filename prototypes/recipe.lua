-------------------------------------------------------------------------- Intermediates

local wood_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
if wood_item == "lumber" then
  data:extend({
    {
      type = "recipe",
      name = "lumber",
      ingredients = {
        mods["expensive-mode"] and {type="item", name="wood", amount=4} or {type="item", name="wood", amount=2}
      },
      results = {{type="item", name="lumber", amount=1}},
      allow_productivity = true
    }
  })
end

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-transport-belt",
      enabled = not mods["aai-industry"],
      ingredients = {
        {type="item", name=wood_item, amount=1},
        {type="item", name="copper-cable", amount=2}
      },
      results = {{type="item", name="wood-transport-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-underground-belt",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name=wood_item, amount=1},
        {type="item", name="wood-transport-belt", amount=4}
      },
      results = {{type="item", name="wood-underground-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-splitter",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name=wood_item, amount=2},
        {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=2}
      },
      results = {{type="item", name="wood-splitter", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Electric poles

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "recipe",
      name = "big-wood-electric-pole",
      enabled = false,
      ingredients = {
        {type="item", name="small-electric-pole", amount=2},
        {type="item", name="steel-plate", amount=1},
        {type="item", name=wood_item, amount=2},
      },
      results = {{type="item", name="big-wood-electric-pole", amount=2}}
    }
  })
end
