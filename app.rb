# 配列
arr1 = ['chika', 'you', 'riko', 'ruby', 'yoshiko', 'hanamaru', 'kanan', 'mari', 'dia']
arr1.each do |name|
  p name
end

# 一部だけ抜き出す
arr2 = arr1[3..5]
p arr2

# 要素の追加と削除
arr2.append('yohane')
p arr2
arr2.delete('yohane')
p arr2
