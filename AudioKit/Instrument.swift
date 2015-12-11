//
//  Instrument.swift
//  AudioKit
//
//  Created by Matthew Russo on 11/12/15.
//  Copyright © 2015 AudioKit. All rights reserved.
//



class FMSynth: AKInstrument {
    var frequency = AKInstrumentProperty(value: 440, minimum: 150, maximum: 740)
    var carrierMultiplier = AKInstrumentProperty(value: 0.5, minimum: 0.0, maximum: 1.0)
    var modulationIndex = AKInstrumentProperty(value: 0.5, minimum: 0.0, maximum: 1.0)
    var amplitude = AKInstrumentProperty(value: 0.25, minimum: 0.0, maximum: 0.5)
    
    override init() {
        super.init()
        
        let fmOscillator = AKFMOscillator()
        fmOscillator.baseFrequency = frequency
        fmOscillator.carrierMultiplier = carrierMultiplier
        fmOscillator.modulationIndex = modulationIndex
        fmOscillator.amplitude = amplitude
        
        
        setAudioOutput(fmOscillator)
        
    }
}


class touchInstrument: AKInstrument {
    
    // INSTRUMENT CONTROLS =====================================================
    
    var frequency            = AKInstrumentProperty(value: 440, minimum: 1.0, maximum: 880)
    var carrierMultiplier    = AKInstrumentProperty(value: 1.0, minimum: 0.0, maximum: 2.0)
    var modulatingMultiplier = AKInstrumentProperty(value: 1, minimum: 0, maximum: 2)
    var modulationIndex      = AKInstrumentProperty(value: 15,  minimum: 0,   maximum: 30)
    var amplitude            = AKInstrumentProperty(value: 0.1, minimum: 0,   maximum: 0.2)
    
    // INSTRUMENT DEFINITION ===================================================
    
    override init() {
        super.init()
        
        addProperty(frequency)
        addProperty(amplitude)
        addProperty(carrierMultiplier)
        addProperty(modulatingMultiplier)
        addProperty(modulationIndex)
        
        let fmOscillator = AKFMOscillator(
            waveform: AKTable.standardSineWave(),
            baseFrequency: frequency,
            carrierMultiplier: carrierMultiplier,
            modulatingMultiplier: modulatingMultiplier,
            modulationIndex: modulationIndex,
            amplitude: amplitude
        )
        
        setAudioOutput(fmOscillator)
    }
}

