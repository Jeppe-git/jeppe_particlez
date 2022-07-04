-- Jesper "jeppe"

RegisterNetEvent('jeppe_particlez:useParticles') -- använd TriggerEvent('jeppe_particlez:useParticles', dict, particlename, x, y, z)
AddEventHandler('jeppe_particlez:useParticles', function(dict, particleName, x, y, z)
	Citizen.CreateThread(function()
		RequestNamedPtfxAsset(dict)
		while not HasNamedPtfxAssetLoaded(dict) do
			Citizen.Wait(0)
		end

		UseParticleFxAssetNextCall(dict)
		StartParticleFxNonLoopedAtCoord(particleName, x, y, z, 0.0, 0.0, 0.0, 0.2, false, false, false) -- här kan du ändra skala osv på effekten
	end)
end)

-- Partikel Lista: https://gist.github.com/alexguirre/af70f0122957f005a5c12bef2618a786