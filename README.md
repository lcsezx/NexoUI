# Nexo UI v1.0

Biblioteca para criação de interfaces no Roblox.

## Carregar
```lua
local Nexo = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Main.lua"))()
```

## Criar janela

```lua
local Janela = Nexo:CreateWindow({
    Title = "Meu Script",
    Size = {Width = 600, Height = 350},
    Theme = "Dark"
})
```

## Criar abas

```lua
local Aba1 = Janela:CreateTab("Aba 1")
local Aba2 = Janela:CreateTab("Aba 2")
```

## Criar seções

```lua
local Secao = Aba1:CreateSection("Configurações")
```

# Elementos

## Criar um botao Liga/Desliga

```lua
Secao:Toggle("Toggle", false, function(v) end)
```

## Criando uma CheckBox

```lua
Secao:Checkbox("Checkbox", true, function(v) end)
```

## Criando uma Slider

```lua
Secao:Slider("Slider", 0, 100, 50, function(v) end)
```

## Criando um botão normal

```lua
Secao:Button("Button", function() end)
```

## Criando um DropDown

```lua
Secao:Dropdown("Dropdown", {"Op1","Op2"}, "Op1", function(v) end)
```

## Criando um Seletor de Cores

```lua
Secao:ColorPicker("Color", Color3.fromRGB(255,0,0), function(c) end)
```

## Criando uma Keybind

```lua
Secao:Keybind("Keybind", "V", function(k) end)
Secao:Label("Label")
```
## Criando uma caixa de texto 

```lua
Secao:Textbox("Textbox", function(t) end)
```
