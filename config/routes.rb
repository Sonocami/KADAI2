Rails.application.routes.draw do
  root to: 'homes#top'#topページからindexへ飛ぶ
  resources:books
end
