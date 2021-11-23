50.times do 
  Worktime.create!(
    pomo_time: 1,
    user_id: 1,
    created_at: (rand*10).days.ago
  )
end