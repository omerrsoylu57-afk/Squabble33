local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({Name = "Atton'un Atölyesi | Saf Yerel", KeySystem = false})
local Tab = Window:CreateTab("Ekonomi", 4483362458)

local ParaMiktari = 0
Tab:CreateInput({
   Name = "Miktar Gir",
   PlaceholderText = "Sayıyı yaz...",
   Callback = function(Text) ParaMiktari = tonumber(Text) or 0 end,
})

Tab:CreateButton({
   Name = "Yerel Olarak Güncelle",
   Callback = function()
      -- Sunucuyla bağlantı kuran hiçbir fonksiyon (FireServer vb.) yok!
      -- Sadece yerel oyuncu verisini hedefliyoruz.
      local player = game.Players.LocalPlayer
      local bulundu = false
      
      -- Oyuncunun içindeki tüm değerleri tara
      for _, obj in pairs(player:GetDescendants()) do
          if obj:IsA("NumberValue") or obj:IsA("IntValue") then
              -- Buradaki isimleri senin oyununda hangisi varsa onunla eşleştirecek
              if obj.Name == "Won" or obj.Name == "Money" or obj.Name == "Cash" then
                  obj.Value = ParaMiktari
                  bulundu = true
              end
          end
      end
      
      if bulundu then
          Rayfield:Notify({Title = "İşlem Tamam", Content = "Yerel değer güncellendi.", Duration = 3})
      else
          Rayfield:Notify({Title = "Hata", Content = "Yerel bir 'Won' veya 'Money' verisi bulunamadı.", Duration = 3})
      end
   end,
})
