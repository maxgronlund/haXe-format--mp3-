// Goal write a generate file stored in a vector/RAM to disk as a mp3 file

import format.mp3.Data;
import format.mp3.Reader;
import format.mp3.Writer;

import  flash.Vector;  

class Main
{
	var sndBuf:Vector<Float>; //<<---- sound buffer i want to save as mp3:
	
	var writer:format.mp3.Writer;
	var output:haxe.io.Output;
	var xData:haxe.io.Bytes;
	var mp3header:MP3Header;
	var iD3v2Info:format.mp3.ID3v2Info;
	var mp3:format.mp3.MP3;
	
	static function main(){
		new Main();
	}
	
	public function new(){
		// 
		createAudio();
		
		writer = new Writer(output);
		// output 
		
		mp3header.version = MPEGVersion.MPEG_V1;
		// etc... what MPEGVersion to use?? I have no clue
		
		iD3v2Info.versionBytes = 0;
		iD3v2Info.flagByte = 0;
		iD3v2Info.data = xData;
		// etc... what variables to use?? I have no clue
		
		writer.writeID3v2(iD3v2Info);
		
		writer.write(mp3, false);

	//	writer.write(, false);
		trace('chunky beacon');
	}
	
	private function createAudio():Void
	{
		// create interleaved stereo
		sndBuf = new Vector<Float>();
		
		var amp:Float = -1;
		var freq:Float = 440/44100;

		// create a stereo sawtoot sound of one sec length
		for(i in 0...44100){
			sndBuf[i*2] 	= amp;
			sndBuf[(i*2)+1] = amp;
			amp += freq;
			if(amp > 1.0) amp -= 2.0;
		}
	}
}
