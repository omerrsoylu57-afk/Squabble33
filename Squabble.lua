local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Atton'un Atölyesi | Squabble Pro",
   LoadingTitle = "Sistem Bağlanıyor...",
   LoadingSubtitle = "by Joker",
   KeySystem = false
})

local Tab = Window:CreateTab("Ekonomi", 4483362458)

local ParaMiktari = 0
Tab:CreateInput({
   Name = "Miktar Gir",
   PlaceholderText = "Sayıyı yaz...",
   Callback = function(Text) ParaMiktari = tonumber(Text) or 0 end,
})

Tab:CreateButton({
   Name = "Parayı (Won) Yükle",
   Callback = function()
      -- Bu kod, oyunun içindeki tüm 'Remote' nesnelerini tarar
      -- Squabble RP gibi oyunlarda para genelde 'UpdateMoney' veya 'GiveMoney' isimli bir Event ile verilir
      local basarili = false
      
      for _, v in pairs(game:GetDescendants()) do
          if v:IsA("RemoteEvent") and (v.Name:lower():find("money") or v.Name:lower():find("won") or v.Name:lower():find("add")) then
              -- Burası sunucuya "bana bu kadar para ver" isteğini gönderir
              v:FireServer(ParaMiktari) 
              basarili = true
          end
      end
      
      if basarili then
          Rayfield:Notify({Title = "İşlem", Content = "İstek sunucuya gönderildi!", Duration = 5})
      else
          Rayfield:Notify({Title = "Hata", Content = "Tetikleyici (Remote) bulunamadı!", Duration = 5})
      end
   end,
})
