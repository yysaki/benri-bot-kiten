-- reference url: http://qiita.com/Tatsuki-I/items/f9347f6d710d7edfaccc

pastmsg = ''

robot:hear(".+", function(res)
  if not string.match(res.message.text, "^s/%w+/%w*/?$") then
    pastmsg = res.message.text
  else
    before, after = string.match(res.message.text, "^s/(%w+)/(%w*)/?$")

    if not (string.match(pastmsg, before) == nil) then
      res:send(string.gsub(pastmsg, before, after))
    else
      res:send("「" .. before .. "」は見つかりません")
    end
  end
end)
