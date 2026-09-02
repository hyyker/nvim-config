-- pyright for types, ruff (see ruff.lua) for lint + import organisation.
return {
	settings = {
		pyright = { disableOrganizeImports = true }, -- ruff owns this
	},
}
