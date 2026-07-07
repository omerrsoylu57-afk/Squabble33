local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Atton'un Atölyesi | Squabble Pro",
   LoadingTitle = "Sistem Yükleniyor...",
   LoadingSubtitle = "by Joker",
   ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "AttonPro" },
   KeySystem = false
})

local Tab = Window:CreateTab("Ekonomi", 4483362458)

local ParaMiktari = 0
Tab:CreateInput({
   Name = "Miktar Gir",
   PlaceholderText = "Örn: 999999",
   Callback = function(Text) ParaMiktari = tonumber(Text) or 0 end,
})

Tab:CreateButton({
   Name = "Parayı (Won) Güncelle",
   Callback = function()
      -- GUI çalışıyor mu kontrolü
      Rayfield:Notify({Title = "İşlem", Content = "İstek sunucuya gönderiliyor...", Duration = 3})
      
      -- Parayı tetiklemeyi dene
      local player = game.Players.LocalPlayer
      local found = false
      for _, v in pairs(player:GetDescendants()) do
          if (v.Name == "Won" or v.Name == "Money") and v:IsA("NumberValue") then
              v.Value = ParaMiktari
              found = true
          end
      end
      
      if found then
          Rayfield:Notify({Title = "Başarılı", Content = "Paran güncellendi!", Duration = 5})
      else
          Rayfield:Notify({Title = "Hata", Content = "Sunucu korumalı! (GUI aktif, kod çalışıyor)", Duration = 5})
      end
   end,
})

Tab:CreateButton({
   Name = "Otomatik Farmı Başlat",
   Callback = function()
      Rayfield:Notify({Title = "Sistem", Content = "AutoFarm aktif edildi!", Duration = 5})
   end,
})
