local gc=love.graphics

local scene={}

function scene.sceneBack()
    saveSettings()
end

local fakeBlock={{true}}
function scene.draw()
    local skinLib=SKIN.lib[SETTING.skinSet]
    gc.push('transform')
    gc.translate(720,149-WIDGET.scrollPos)
    gc.scale(2)
    gc.setColor(1,1,1)
    PLY.draw.drawGhost[SETTING.ghostType](fakeBlock,0,0,SETTING.ghost,skinLib,math.floor(TIME()*3)%16+1)
    gc.pop()

    gc.push('transform')
    gc.setColor(1,1,1)
    local T=skinLib[1]
    gc.translate(0,1410-WIDGET.scrollPos)
    gc.setShader(SHADER.blockSatur)
    gc.draw(T,435,0)gc.draw(T,465,0)gc.draw(T,465,30)gc.draw(T,495,30)
    gc.setShader(SHADER.fieldSatur)
    for i=1,8 do
        gc.draw(skinLib[i],330+30*i,100)
        gc.draw(skinLib[i+8],330+30*i,130)
    end
    gc.setShader()
    gc.pop()
end

scene.widgetScrollHeight=900
scene.widgetList={
    WIDGET.newText{name="title",          x=640,y=15,font=80},

    WIDGET.newButton{name="sound",        x=200,y=80,w=240,h=80,color='lC',font=35,code=swapScene('setting_sound','swipeR')},
    WIDGET.newButton{name="game",         x=1080,y=80,w=240,h=80,color='lC',font=35,code=swapScene('setting_game','swipeL')},

    WIDGET.newSwitch{name="block",        x=380,y=180,lim=300,disp=SETval('block'),code=SETrev('block')},
    WIDGET.newSwitch{name="smooth",       x=380,y=250,lim=300,disp=SETval('smooth'),code=SETrev('smooth')},
    WIDGET.newSwitch{name="upEdge",       x=380,y=320,lim=300,disp=SETval('upEdge'),code=SETrev('upEdge')},
    WIDGET.newSwitch{name="bagLine",      x=380,y=390,lim=300,disp=SETval('bagLine'),code=SETrev('bagLine')},

    WIDGET.newSelector{name="ghostType",  x=915,y=180,        w=350,list={'color','gray','colorCell','grayCell','colorLine','grayLine'},disp=SETval('ghostType'),code=SETsto('ghostType')},
    WIDGET.newSlider{name="ghost",        x=740,y=240,lim=280,w=350,unit=1,disp=SETval('ghost'),    show="percent",code=SETsto('ghost')},
    WIDGET.newSlider{name="center",       x=740,y=300,lim=280,w=350,unit=1,disp=SETval('center'),   show="percent",code=SETsto('center')},
    WIDGET.newSlider{name="grid",         x=740,y=360,lim=280,w=350,unit=.4,disp=SETval('grid'),    show="percent",code=SETsto('grid')},
    WIDGET.newSlider{name="lineNum",      x=740,y=420,lim=280,w=350,unit=1,disp=SETval('lineNum'),  show="percent",code=SETsto('lineNum')},

    WIDGET.newSlider{name="lockFX",       x=330,y=460,lim=280,w=540,unit=5,disp=SETval('lockFX'),   code=SETsto('lockFX')},
    WIDGET.newSlider{name="dropFX",       x=330,y=520,lim=280,w=540,unit=5,disp=SETval('dropFX'),   code=SETsto('dropFX')},
    WIDGET.newSlider{name="moveFX",       x=330,y=580,lim=280,w=540,unit=5,disp=SETval('moveFX'),   code=SETsto('moveFX')},
    WIDGET.newSlider{name="clearFX",      x=330,y=640,lim=280,w=540,unit=5,disp=SETval('clearFX'),  code=SETsto('clearFX')},
    WIDGET.newSlider{name="splashFX",     x=330,y=700,lim=280,w=540,unit=5,disp=SETval('splashFX'), code=SETsto('splashFX')},
    WIDGET.newSlider{name="shakeFX",      x=330,y=760,lim=280,w=540,unit=5,disp=SETval('shakeFX'),  code=SETsto('shakeFX')},
    WIDGET.newSlider{name="atkFX",        x=330,y=820,lim=280,w=540,unit=5,disp=SETval('atkFX'),    code=SETsto('atkFX')},

    WIDGET.newSelector{name="frame",      x=400,y=890,lim=280,w=460,list={8,10,13,17,22,29,37,47,62,80,100},disp=SETval('frameMul'),code=SETsto('frameMul')},
    WIDGET.newSwitch{name="FTlock",       x=950,y=890,lim=290,disp=SETval('FTLock'),                code=SETrev('FTLock')},

    WIDGET.newSwitch{name="text",         x=450,y=980,lim=360,disp=SETval('text'),                  code=SETrev('text')},
    WIDGET.newSwitch{name="score",        x=450,y=1030,lim=360,disp=SETval('score'),                code=SETrev('score')},
    WIDGET.newSwitch{name="bufferWarn",   x=450,y=1100,lim=360,disp=SETval('bufferWarn'),           code=SETrev('bufferWarn')},
    WIDGET.newSwitch{name="showSpike",    x=450,y=1150,lim=360,disp=SETval('showSpike'),            code=SETrev('showSpike')},
    WIDGET.newSwitch{name="nextPos",      x=450,y=1220,lim=360,disp=SETval('nextPos'),              code=SETrev('nextPos')},
    WIDGET.newSwitch{name="highCam",      x=450,y=1270,lim=360,disp=SETval('highCam'),              code=SETrev('highCam')},
    WIDGET.newSwitch{name="warn",         x=450,y=1340,lim=360,disp=SETval('warn'),                 code=SETrev('warn')},

    WIDGET.newSwitch{name="clickFX",      x=950,y=980,lim=360,disp=SETval('clickFX'),               code=SETrev('clickFX')},
    WIDGET.newSwitch{name="power",        x=950,y=1070,lim=360,disp=SETval('powerInfo'),            code=SETrev('powerInfo')},
    WIDGET.newSwitch{name="clean",        x=950,y=1160,lim=360,disp=SETval('cleanCanvas'),          code=SETrev('cleanCanvas')},
    WIDGET.newSwitch{name="fullscreen",   x=950,y=1250,lim=360,disp=SETval('fullscreen'),           code=switchFullscreen},
    WIDGET.newSwitch{name="bg",           x=950,y=1340,lim=360,disp=SETval('bg'),
        code=function()
            BG.set('none')
            SETTING.bg=not SETTING.bg
            BG.set()
        end},

    WIDGET.newSelector{name="blockSatur", x=800,y=1440,w=300,color='lN',
        list={'normal','soft','gray','light','color'},
        disp=SETval('blockSatur'),
        code=function(v)SETTING.blockSatur=v;applyBlockSatur(SETTING.blockSatur)end
        },
    WIDGET.newSelector{name="fieldSatur", x=800,y=1540,w=300,color='lN',
        list={'normal','soft','gray','light','color'},
        disp=SETval('fieldSatur'),
        code=function(v)SETTING.fieldSatur=v;applyFieldSatur(SETTING.fieldSatur)end
        },

    WIDGET.newButton{name="back",         x=1140,y=640,w=170,h=80,fText=TEXTURE.back,code=backScene},
}

return scene
