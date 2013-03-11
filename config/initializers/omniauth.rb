Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'PwaWlUkREyLobOeg3s71rA', 'v5iTeIfZiPxgmcDx4Tat9tBZ12Uk1NSF7R8ynTDU'
  #provider :facebook, 'APP_ID', 'APP_SECRET'
end
