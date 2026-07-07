local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "Atton'un Atölyesi | Pro", KeySystem = false})
local Tab = Window:CreateTab("Ekonomi", 4483362458)

Tab:CreateButton({
   Name = "Parayı (Won) Güncelle (Event Tetikle)",
   Callback = function()
      -- Bu kod, oyunun içindeki 'GiveMoney' gibi bir olayı tetiklemeyi dener
      -- Oyunun kendi içinde tanımlı olayları bulmaya çalışıyoruz
      for _, v in pairs(game:GetDescendants()) do
          if v:IsA("RemoteEvent") and (v.Name:lower():find("money") or v.Name:lower():find("reward")) then
              v:FireServer(999999) -- Burası miktarı tetikler
              Rayfield:Notify({Title = "İşlem", Content = "Ödül isteği sunucuya gönderildi!", Duration = 5})
              return
          end
      end
      Rayfield:Notify({Title = "Hata", Content = "Sunucu tetikleyicisi bulunamadı!", Duration = 5})
   end,
})
