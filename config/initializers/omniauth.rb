Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'PwaWlUkREyLobOeg3s71rA', 'v5iTeIfZiPxgmcDx4Tat9tBZ12Uk1NSF7R8ynTDU'
  provider :facebook, '215641658596687', 'df63638e7aaa593a778e3da6fbcf12d0'
end
