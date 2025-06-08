local effects = {
    {position = Position(32369, 32241, 7), text = 'Welcome to Libra Server!', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32359, 32239, 7), text = 'TRAINERS', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32362, 32239, 7), text = 'TELEPORTS', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32362, 32221, 7), text = 'HUNTS', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(32360, 32221, 7), text = 'QUESTS', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32358, 32221, 7), text = 'BOSSES', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32356, 32221, 7), text = 'FORGE', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32265, 32461, 7), text = 'EASY', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32267, 32461, 7), text = 'MEDIUM', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32269, 32461, 7), text = 'HARD', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32260, 32464, 7), text = 'TEMPLE', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32297, 32464, 7), text = 'TEMPLE', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32262, 32482, 7), text = 'TEMPLE', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32366, 32241, 7), text = '<--', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32241, 7), text = '<--', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32353, 32225, 7), text = 'VIP', effect = CONST_ME_GROUNDSHAKER},
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(3000)
animatedText:register()

