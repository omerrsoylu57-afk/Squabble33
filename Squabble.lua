local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Atton'un Atölyesi | Universal Squabble",
   LoadingTitle = "Sistem Taranıyor...",
   LoadingSubtitle = "by Joker",
   KeySystem = false
})

local Tab = Window:CreateTab("Ekonomi", 4483362458)

local ParaMiktari = 0
Tab:CreateInput({
   Name = "Miktar Gir",
   PlaceholderText = "Örn: 999999999",
   Callback = function(Text) ParaMiktari = tonumber(Text) or 0 end,
})

Tab:CreateButton({
   Name = "Parayı (Won) Güncelle",
   Callback = function()
      -- BURASI İŞİN SIRRI: Oyunun içindeki tüm 'NumberValue' ları tarar
      local basarili = false
      for _, v in pairs(game.Players.LocalPlayer:GetDescendants()) do
          if (v.Name == "Won" or v.Name == "Money" or v.Name == "Cash") and v:IsA("NumberValue") then
              v.Value = ParaMiktari
              basarili = true
          end
      end
      
      if basarili then
          Rayfield:Notify({Title = "Başarılı", Content = "Won miktarı güncellendi!", Duration = 5})
      else
          Rayfield:Notify({Title = "Hata", Content = "Para değeri otomatik bulunamadı! (Oyun korumalı olabilir)", Duration = 5})
      end
   end,
})
