#!/usr/bin/perl
#
# .Astronomy Player - webify dotastro talks
# Created by Stuart for .Astronomy 4 (2012)
#
# USAGE:
#
# perl webify.pl <dir> [-makeslides] [-makeaudio] [-source=dir] [-extractaudio=file.mov]
#
# where:
#  dir                  Directory for the output.
#  -source=dir          Directory for the input (defaults to "<dir>/source/")
#                       This directory should contain:
#                        * setup.txt file containing details of the presentation
#                        * <dir>.wav - the presentation audio
#                        * <images> - each of the images referenced in setup.txt (generate from PDF e.g. "convert -density 200 AlbertoAccomazzi_Slides.pdf slide.png")
#                        * <videos> - each of the movies referenced in setup.txt
#                        * tweets.txt - the tweets, 1 per line e.g. {"place":null,"text":"good :: intentional choices in data viz -- data, designer, reader: \"it's not about YOU\" (the scientist) #dotastro","id_str":"222967019451064320","favorited":false,"coordinates":null,"geo":null,"created_at":"Wed Jul 11 08:14:14 +0000 2012","in_reply_to_status_id_str":null,"contributors":null,"in_reply_to_screen_name":null,"source":"\u003Ca href=\"http:\/\/twitter.com\/#!\/download\/ipad\" rel=\"nofollow\"\u003ETwitter for iPad\u003C\/a\u003E","in_reply_to_user_id_str":null,"in_reply_to_user_id":null,"in_reply_to_status_id":null,"retweeted":false,"retweet_count":0,"truncated":false,"user":{"is_translator":false,"profile_use_background_image":true,"profile_image_url_https":"https:\/\/si0.twimg.com\/profile_images\/2170807289\/twitter_normal.jpg","id_str":"16890327","profile_text_color":"53777A","statuses_count":3441,"following":null,"profile_background_image_url":"http:\/\/a0.twimg.com\/profile_background_images\/130022541\/x0772cc6c941c080a0be8854dbc49f6b.png","followers_count":337,"profile_image_url":"http:\/\/a0.twimg.com\/profile_images\/2170807289\/twitter_normal.jpg","default_profile_image":false,"created_at":"Tue Oct 21 18:01:26 +0000 2008","profile_link_color":"C02942","description":"watching a virtual sky, reading at a digital library, tweeting to the ghosts in the machine.","time_zone":"Eastern Time (US & Canada)","favourites_count":1131,"friends_count":395,"url":"http:\/\/www.google.com\/profiles\/august.fly","verified":false,"profile_background_color":"D95B43","profile_background_tile":true,"profile_background_image_url_https":"https:\/\/si0.twimg.com\/profile_background_images\/130022541\/x0772cc6c941c080a0be8854dbc49f6b.png","contributors_enabled":false,"geo_enabled":false,"notifications":null,"profile_sidebar_fill_color":"ECD078","protected":false,"location":"lincoln, ma","listed_count":24,"follow_request_sent":null,"name":"August Muench","profile_sidebar_border_color":"542437","id":16890327,"default_profile":false,"show_all_inline_media":true,"lang":"en","utc_offset":-18000,"screen_name":"augustmuench"},"id":222967019451064320,"entities":{"urls":[],"hashtags":[{"text":"dotastro","indices":[104,113]}],"user_mentions":[]}}{"place":null,"text":"RT @augustmuench: good :: intentional choices in data viz -- data, designer, reader: \"it's not about YOU\" (the scientist) #dotastro","id_str":"222967250578194432","favorited":false,"coordinates":null,"geo":null,"created_at":"Wed Jul 11 08:15:09 +0000 2012","in_reply_to_status_id_str":null,"contributors":null,"in_reply_to_screen_name":null,"source":"\u003Ca href=\"http:\/\/www.tweetdeck.com\" rel=\"nofollow\"\u003ETweetDeck\u003C\/a\u003E","in_reply_to_user_id_str":null,"in_reply_to_user_id":null,"in_reply_to_status_id":null,"retweeted":false,"retweet_count":0,"truncated":false,"user":{"is_translator":false,"profile_use_background_image":false,"profile_image_url_https":"https:\/\/si0.twimg.com\/profile_images\/2225116000\/paper_sa_normal.jpg","id_str":"15099133","profile_text_color":"000000","statuses_count":23314,"following":null,"profile_background_image_url":"http:\/\/a0.twimg.com\/images\/themes\/theme1\/bg.png","followers_count":3959,"profile_image_url":"http:\/\/a0.twimg.com\/profile_images\/2225116000\/paper_sa_normal.jpg","default_profile_image":false,"created_at":"Thu Jun 12 17:59:04 +0000 2008","profile_link_color":"0000ff","description":"Astronomer. Educator. Maker of tiny comets. Finished my Ph.D, and now working on http:\/\/cosmoquest.org\/","time_zone":"Eastern Time (US & Canada)","favourites_count":54,"friends_count":886,"url":"http:\/\/noisyastronomer.com","verified":false,"profile_background_color":"5916AF","profile_background_tile":false,"profile_background_image_url_https":"https:\/\/si0.twimg.com\/images\/themes\/theme1\/bg.png","contributors_enabled":false,"geo_enabled":false,"notifications":null,"profile_sidebar_fill_color":"8BA4E1","protected":false,"location":"Edwardsville, IL","listed_count":543,"follow_request_sent":null,"name":"Nicole","profile_sidebar_border_color":"02239B","id":15099133,"default_profile":false,"show_all_inline_media":false,"lang":"en","utc_offset":-18000,"screen_name":"NoisyAstronomer"},"id":222967250578194432,"entities":{"urls":[],"hashtags":[{"text":"dotastro","indices":[122,131]}],"user_mentions":[{"indices":[3,16],"id_str":"16890327","name":"August Muench","id":16890327,"screen_name":"augustmuench"}]}}
#  -extractslides=file  Extract slides from a PDF
#  -extractaudio=file   If this is provided the script will extract the audio to <source>/extracted.wav
#  -extractvideo=file   If this and a duration are provided the script will extract a video segment
#  -start=720           Time at which to start the extraction (seconds or mm:ss)
#  -end=750             Time at which to end the extraction (seconds or mm:ss)
#  -makeslides          Generate/re-generate the stills
#  -makeaudio           Generate/re-generate the audio
#
# You will need a template.html file in the working directory
#
#  EXAMPLES:
#
#  1) Extract the slides from the PDF
#     perl webify.pl -extractslides=accomazzi/source/AlbertoAccomazzi.pdf
#
#  2) Extract wav audio from a .mov file (saves "extracted.wav" to same directory as input file)
#     perl webify.pl -extractaudio=accomazzi/source/AlbertoAccomazzi.mov
#
#  3) Extract part of the video (saves "extracted.mp4" to same directory as input file)
#     perl webify.pl -extractvideo=accomazzi-source/AlbertoAccomazzi.mov -start=19:53 -end=36:48
#
#  4) To create the initial setup.txt file (you'll need to edit it so that the content and times are correct)
#     perl webify.pl accomazzi/ -source=accomazzi/source/ -setup
#
#  5) To create all the slides, audio and video files
#     perl webify.pl accomazzi/ -source=accomazzi/source/ -makeslides -makeaudio -makevideo
#
#  6) If you just need to regenerate the index.html file
#     perl webify.pl accomazzi/ -source=accomazzi/source/


# Define locations of helper apps
$app{'VLC'} = "VLC";
$app{'ffmpeg'} = "ffmpeg";
$app{'convert'} = "convert";
if(-e "dotastro.config"){
	open(CONFIG,"dotastro.config");
	@lines = <CONFIG>;
	close(CONFIG);
	foreach $line (@lines){
		if($line =~ /^VLC[\t\s]+([^\n\r]*)/){ $app{'VLC'} = $1; }
		if($line =~ /^ffmpeg[\t\s]+([^\n\r]*)/){ $app{'ffmpeg'} = $1; }
		if($line =~ /^convert[\t\s]+([^\n\r]*)/){ $app{'convert'} = $1; }
	}
}


# Useful command line examples
# Extract segment of MOV to mp4
# -ss is start time, -t is the duration
# ffmpeg -y -i MVI_3864.MOV -r 30000/1001 -b 5M -bt 6M -vcodec mpeg4 -ss 424 -t 192 -an output.mp4
#
# Convert to WebM (cropped)
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc --stop-time=62 output.mp4 --sout "#transcode{vcodec=VP80,vb=500,acodec=vorbis,ab=48,channels=2,afilter="no-audio",vfilter=croppadd{cropright=100,cropleft=100,cropbottom=4},width=800}:std{access=file,mux="ffmpeg{mux=webm}",dst=movie.webm}"
# Convert to MP4 (cropped)
# ffmpeg -i output.mp4 -b 500k -vf crop=in_w-512:in_h:256:0,scale=600:-1 movie.mp4
#
# MOV -> Wav
# ffmpeg -i MVI_4139.MOV mvi_4139.wav
# Wav -> Low bandwidth OGG
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc alyssa.wav --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=alyssatest2.ogg,access=file}" vlc://quit
# Wav -> Low bandwidth MP3
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc alyssa.wav --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=alyssatest2.mp3,access=file}" vlc://quit


use Time::Local;

###############################
# Process command line options

# Set up command line flags
%flag = ();
$flag{'makeslides'} = 0;
$flag{'makeaudio'} = 0;
$flag{'makevideo'} = 0;
$flag{'source'} = "";
$flag{'setup'} = "";
$flag{'overwrite'} = 0;
$flag{'extractslides'} = "";
$flag{'extractaudio'} = "";
$flag{'extractvideo'} = "";
$flag{'start'} = 0;
$flag{'end'} = 0;
for($i = 0; $i < @ARGV ; $i++){
	# Things starting with '-' are flags
	if($ARGV[$i] =~ /^-([^\=]*)\=?([^\=]*)$/){
		# Only process them if we already know about them
		if(exists($flag{$1})){
			$flag{$1} = ($2) ? $2 : 1;
		}
	}
	if(-d $ARGV[$i]){
		$dir = $ARGV[$i];
		$dir =~ s/\/$//g;	# remove trailing slash if there is one
	}
}
if($flag{'source'} eq "" || !-d $flag{'source'}){ $flag{'source'} = "$dir/source/"; if($flag{'source'} !~ /\/$/){ $flag{'source'} .= "/"; } }
if($flag{'setup'} eq "" || !-e $flag{'setup'}){ $flag{'setup'} = "$dir/setup.txt"; }
if($flag{'tweets'} eq "" || !-e $flag{'tweets'}){ $flag{'tweets'} = "$dir/tweets.txt"; }
if($flag{'extractslides'} eq "" || !-e $flag{'extractslides'}){ $flag{'extractslides'} = ""; }
if($flag{'extractaudio'} eq "" || !-e $flag{'extractaudio'}){ $flag{'extractaudio'} = ""; }
if($flag{'extractvideo'} eq "" || !-e $flag{'extractvideo'}){ $flag{'extractvideo'} = ""; }
if($flag{'start'} =~ /^([^\:]*)\:([^\:]*)$/){ $flag{'start'} = $1*60 + $2; }
if($flag{'end'} =~ /^([^\:]*)\:([^\:]*)$/){ $flag{'end'} = $1*60 + $2; }
if($flag{'end'}){ $flag{'duration'} = $flag{'end'}-$flag{'start'}; }
# We now know what we've been commanded to do
##############################################

if(-e $flag{'extractslides'}){
	$src = $flag{'extractslides'};
	$src =~ s/[^\/]*$//;
	$dst = "$src/slide-%02d.png";
	# We run the convert command with a density of 200 to make the text nicer
	`$app{'convert'} -density 200 $flag{'extractslides'} $dst`;
	exit;
}

if(-e $flag{'extractaudio'}){
	$src = $flag{'extractaudio'};
	$src =~ s/[^\/]*$//;
	$dst = "$src/extracted.wav";
	$ext = "";
	if($flag{'start'} > 0){ $ext .= " -ss $flag{'start'}"; }
	if($flag{'duration'} > 0){ $ext .= " -t $flag{'duration'}"; }
 	`$app{'ffmpeg'} $ext -i $flag{'extractaudio'} $dst`;
	exit;
}

if(-e $flag{'extractvideo'}){
	if($flag{'duration'} > 0){
		$dst = $flag{'extractvideo'};
		$dst =~ s/[^\/]*$//;
		if($dst !~ /\/$/){ $dst .= "/"; }
		$dst .= "extracted.mp4";
		$ext = "-ss $flag{'start'} -t $flag{'duration'}";
		if(!-e $dst){
			`$app{'ffmpeg'} -y -i $flag{'extractvideo'} -r 30000/1001 -b 5M -bt 6M -vcodec mpeg4 $ext -an $dst`;
		}
	}
	exit;
}

if(!-d $dir){
	print "Error: You'll need to specify a directory to be processed.\n";
	exit;
}


#####################################
# Create the setup file if requested
if(!-e $flag{'setup'} || (-e $flag{'setup'} && $flag{'overwrite'})){

	opendir my($dh), $flag{'source'} or die "Couldn't open dir '$flag{'source'}': $!";
	my @f = readdir $dh;
	closedir $dh;
	$j = 0;
	@files = ();
	for($i = 0; $ i < (@f) ; $i++){
		if($f[$i] =~ /(.*\.)(jpg|png|jpeg)$/){
			push(@files,$1.$2);
		}
	}

	# Create initial setup
	print "Creating initial setup in $flag{'setup'}... ";
	open(FILE,">",$flag{'setup'});
	print FILE "Title:                                              # the title of the talk\n";
	print FILE "Root: http://dotastronomy.com/wp-content/uploads/5talks/                  \n";
	print FILE "Fullname: ".sprintf("%-41s",ucfirst($dir))." # the full name of the speaker\n";
	print FILE "Audio: extracted.wav                                # the wav file for the audio\n";
	print FILE "Picture: http://www.dotastronomy.com/img/pics/.png  # the avatar image for the speaker\n";
	print FILE "Photographer:                                       # the credit for whoever took the cover image\n";
	print FILE "Curator:                                            # the credit for whoever took the cover image\n";
	print FILE "Date: Wednesday 11 July 10:03                       # the date displayed on the HTML page\n";
	print FILE "Start: Wed Jul 11 08:03:15 +0000 2012               # start time for the talk - used to sync up tweets\n";
	print FILE "More: cruz,borkin,goodman,govender                  # comma separated list of directory names for the 'more' talks section of the page\n";
	print FILE "Width: 1024                                         # width of output slides in pixels\n";
	print FILE "Height: 768                                         # height of output slides in pixels\n";
	print FILE "Videowidth: 640                                     # width of output video in pixels\n";
	print FILE "Videoheight: 480                                    # height of output video in pixels\n";
	print FILE "Youtube: # link to YouTube \n";
	print FILE "Vimeo:  # link to Vimeo\n";
	print FILE "\n";
	print FILE "# each slide or message gets a line of the form: \"time	type	content\"\n";
	for($i = 0; $ i < (@files) ; $i++){
		$fm = "%s";
		if($i==0){ $fm = "\%-35s"; }
		print FILE "00:".sprintf("%02d",$i)."	slide	".sprintf($fm,$files[$i])."\n";
	}
	print FILE "15:00	end\n";
	close(FILE);
	print "done\n";
}
# We should have a setup.txt file by now but just in case we haven't
if(!-e $flag{'setup'}){
	print "Error: There is no setup file $flag{'setup'}.\n";
	exit;
}
######################################

#if($flag{'makeslides'} == 1){
#	print "Moving screenshots.\n";
#	opendir my($dh), $dir or die "Couldn't open dir '$dir': $!";
#	my @files = readdir $dh;
#	closedir $dh;
#	$j = 0;
#	for($i = 0; $ i < (@files) ; $i++){
#		if($files[$i] =~ /^Screen.*.png/){
#			$j++;
#			`mv '$dir/$files[$i]' $dir/$j.png`;
#		}
#	}
#}



###################
# Load the setup
open(FILE,$flag{'setup'});
@lines = <FILE>;
close(FILE);
$photographer = "Dotastronomy";
@ls = ();
$precrop = "";
foreach $line (@lines){
	$line =~ s/[\n\r]//g;
	$line =~ s/\# .*$//g;	# Remove comments - # followed by a space (so as not to zap hashtags)
	$line =~ s/([^\s])[\s]*$/$1/g;	# Remove trailing spaces
	if($line =~ /Title: (.*)$/){
		$title = $1;
	}elsif($line =~ /Audio: (.*)$/){
		$audio = $1;
		$audioext = "wav";
		if($audio =~ s/^(.*)\.([^\.]*)$/$1/){
			$audioext = $2;
		}
	}elsif($line =~ /Picture: (.*)$/){
		$picture = $1;
	}elsif($line =~ /Root: (.*)$/){
		$root = $1;
	}elsif($line =~ /Youtube: (.*)$/){
		$youtube = $1;
	}elsif($line =~ /Vimeo: (.*)$/){
		$vimeo = $1;
	}elsif($line =~ /Curator: (.*)$/){
		$curator = $1;
	}elsif($line =~ /Photographer: (.*)$/){
		$photographer = $1;
	}elsif($line =~ /Fullname: (.*)$/){
		$fullname = $1;
	}elsif($line =~ /Date: (.*)$/){
		$date = $1;
	}elsif($line =~ /Width: (.*)$/){
		$width = $1;
	}elsif($line =~ /Height: (.*)$/){
		$height = $1;
	}elsif($line =~ /Videowidth: (.*)$/){
		$vwidth = $1;
	}elsif($line =~ /Videoheight: (.*)$/){
		$vheight = $1;
	}elsif($line =~ /Start: (.*)$/){
		$talkstart = $1;
	}elsif($line =~ /More: (.*)$/){
		$more = $1;
	}elsif($line =~ /About: (.*)$/){
		$about = "\t\t\t\t\t<div class=\"about\">\n\t\t\t\t\t\t".$1."\n\t\t\t\t\t</div>";
	}elsif($line =~ /Crop: (.*)$/){
		$precrop = "-gravity center -crop $1\+0\+0 \+repage";
	}elsif($line =~ /Expand: (.*)$/){
		$preexpand = "-gravity center -resize $1\+0\+0 -extent $1\+0\+0";
	}else{
		if($line ne ""){
			push(@ls,$line);
		}
	}	
}
if(!$width){ $width = 1024; }
if(!$height){ $height = 768; }
if(!$vwidth){ $width = 640; }
if(!$vheight){ $height = 480; }
@eventdeck = ();
foreach $l (@ls){
	if($l){
		($timestamp,$t,$rest) = split('\t',$l);
		$rest =~ s/[\s ]+$//g;
		push(@eventdeck,{'time'=>$timestamp,'type'=>$t,'content'=>$rest});
	}
}
# End load setup
############################





if($flag{'makeslides'} == 1){
	print "Converting/resizing images...\n";
	# Work out which files we will need to process
	@files = ();
	for($i = 0 ; $i < @eventdeck ; $i++){
		if($eventdeck[$i]{'type'} eq "slide"){
			push(@files,"$eventdeck[$i]{'content'}");
		}
	}

	for($i = 0; $ i < (@files) ; $i++){
		if(-e $flag{'source'}.$files[$i]){
			if($files[$i] =~ /.png$/ || $files[$i] =~ /.jpeg$/ || $files[$i] =~ /.jpg$/){
				$files[$i] =~ s/.(png|jpeg|jpg)$//;
				$ext = $1;
				$wh = $width."x".$height;
				print " -> Converting $flag{'source'}$files[$i].$ext\n";
				`$app{'convert'} $flag{'source'}$files[$i].$ext $preexpand $precrop -resize $wh\^ -gravity center -crop $wh\+0\+0\^ +repage -quality 80 $dir/$files[$i].jpg`;
				`$app{'convert'} $dir/$files[$i].jpg -quality 60 -resize 400x $dir/$files[$i]_medium.jpg`;
				`$app{'convert'} $dir/$files[$i].jpg -quality 60 -resize 168x $dir/$files[$i]_small.jpg`;
			}
		}else{
			print "Warning: $flag{'source'}$files[$i] doesn't exist\n";
		}
	}
}

if($flag{'makeaudio'} == 1){
	print "Encoding audio...\n";
	my @files = ("$audio.$audioext");

	for($i = 0; $ i < (@files) ; $i++){
		if($files[$i] =~ /.$audioext$/){

			print "  - Low bandwidth OGG ($flag{'source'}$files[$i])\n";
			$dst = "$dir\/$audio\_low.ogg";
			if($flag{'overwrite'}){ `rm $dst`; }
			if(!-e $dst){ `$app{'VLC'} --intf=rc $flag{'source'}$files[$i] --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=$dst,access=file}" vlc://quit`; }
			print "done\n";

			print "  - High bandwidth OGG\n";
			$dst = "$dir\/$audio.ogg";
			if($flag{'overwrite'}){ `rm $dst`; }
			if(!-e $dst){ `$app{'VLC'} --intf=rc $flag{'source'}$files[$i] --sout "#transcode{acodec=vorb,ab=64,samplerate=22050}:standard{mux=ogg,dst=$dst,access=file}" vlc://quit`; }
			print "done\n";

			print "  - Low bandwidth MP3\n";
			$dst = "$dir\/$audio\_low.mp3";
			if($flag{'overwrite'}){ `rm $dst`; }
			if(!-e $dst){ `$app{'VLC'} --intf=rc $flag{'source'}$files[$i] --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=$dst,access=file}" vlc://quit` };
			print "done\n";

			print "  - High bandwidth MP3...\n";
			$dst = "$dir\/$audio.mp3";
			if($flag{'overwrite'}){ `rm $dst`; }
			if(!-e $dst){ `$app{'VLC'} --intf=rc $flag{'source'}$files[$i] --sout "#transcode{acodec=mp3,ab=64,channels=2,samplerate=22050}:standard{mux=raw,dst=$dst,access=file}" vlc://quit` };
			print "done\n";
		}
	}	
# $app{'VLC'} --intf=rc alyssa.wav --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=alyssatest2.ogg,access=file}" vlc://quit
# Wav -> Low bandwidth MP3
# $app{'VLC'} --intf=rc alyssa.wav --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=alyssatest2.mp3,access=file}" vlc://quit

}

if($flag{'makevideo'} == 1){
	print "Encoding video...\n";
	# Work out which files we will need to process
	@files = ();
	for($i = 0 ; $i < @eventdeck ; $i++){
		if($eventdeck[$i]{'type'} eq "video"){
			$s = $eventdeck[$i]{'time'};
			$s =~ /([^\:]*)\:([^\:]*)/;
			$s = ($1*60 + $2);
			$e = $eventdeck[$i+1]{'time'};
			$e =~ /([^\:]*)\:([^\:]*)/;
			$e = ($1*60 + $2);
			push(@files,{'file'=>$eventdeck[$i]{'content'},'duration'=>($e-$s)});
		}
	}

	for($i = 0; $ i < (@files) ; $i++){
		$ext = "mp4";
		if($files[$i]{'file'} =~ /.(mp4|mov)$/){
			$files[$i]{'file'} =~ s/.(mp4|mov)$//;
			$ext = $1;
		}
		if(-e $flag{'source'}.$files[$i]{'file'}.".mp4"){
			$dst = "$dir/$files[$i]{'file'}";
			# Convert to MP4 (cropped)
			if(!-e "$dst.mp4"){
				print " - MP4 version ($dst.mp4 cropped to 4:3)\n";
				$canvas = "";
				if($vwidth > $width){
					$canvas = "-vf crop=in_h*4/3:in_h:in_w/2-in_h*2/3:in_h,scale=$vwidth:-1";
				}
#				`$app{'ffmpeg'} -i $flag{'source'}$files[$i]{'file'}.$ext -b 500k -vf crop=in_h*4/3:in_h:in_w/2-in_h*2/3:in_h,scale=$vwidth:-1 $dst.mp4`;
				`$app{'ffmpeg'} -i $flag{'source'}$files[$i]{'file'}.$ext -b 500k $canvas $dst.mp4`;
			}
			# Convert to WebM (cropped)
			if(!-e "$dst.webm"){
				print " - WebM version ($dst.webm; $files[$i]{'duration'}s)\n";
				$canvas = "";
				if($vwidth > $width){
					$canvas = ",vfilter=canvas{width=$vwidth,height=".($vwidth*$height/$width)."}";
				}
				#`$app{'VLC'} --intf=rc --stop-time=62 $flag{'source'}$files[$i]{'file'}.$ext --sout "#transcode{vcodec=VP80,vb=500,acodec=vorbis,ab=48,channels=2,afilter="no-audio",vfilter=croppadd{cropright=100,cropleft=100,cropbottom=4},width=800}:std{access=file,mux="ffmpeg{mux=webm}",dst=$dst.webm}"`;
				`$app{'VLC'} --intf=rc --stop-time=$files[$i]{'duration'} $flag{'source'}$files[$i]{'file'}.$ext --sout "#transcode{vcodec=VP80,vb=500,acodec=vorbis,ab=48,channels=2,afilter="no-audio"$canvas}:std{access=file,mux="ffmpeg{mux=webm}",dst=$dst.webm}" vlc://quit`;
			}
		}
	}	
	print "done\n";
}

$tstart = parse_datetime($talkstart);
$tzoffset = 0;

open(TMPL,"template.html");
@lines = <TMPL>;
close(TMPL);

$slidehtml = "";
%messages = ();
$i = 0;
$s = 0;
foreach $l (@ls){
	if($l){
		($timestamp,$t,$rest) = split('\t',$l);
		if($t eq "slide"){
			$s++;
		}
	}
}

foreach $l (@ls){
	if($l){
		$full = "";
		($timestamp,$t,$rest) = split('\t',$l);
		if($t eq "slide"){
			$i++;
			$rest =~ s/\.(jpeg|png)/\.jpg/;
			if($rest !~ /.jpe?g/){ $full .= $rest.".jpg"; }
			else{ $full = $rest; }
			$small = $full;
			$small =~ s/(.jpg)$/\_small$1/;
			$prevnext = "";
			if($i > 1){ $prevnext .= "<a href=\"#".($i-1)."\">previous</a>"; }
			if($i > 1 && $i < $s){ $prevnext .= " | "; }
			if($i < $s){ $prevnext .= "<a href=\"#".($i+1)."\">next</a>"; }
			$extra = ($i % 3 == 0) ? " last" : "";
			$slidehtml .= "									<li class=\"slide one-fourth".($extra)."\" id=\"".($i)."\"><div class=\"pic\"><a href=\"$root$full\" class=\"big_slide\"><img src=\"$root$small\" alt=\"Slide $i\" /></a></div><div class=\"timestamp\">Time: <time>$timestamp</time>. $prevnext</div></li>\n";
		}
		if($t eq "video"){
			$i++;
			$rest =~ s/\.(mp4|mov|webm)//;
			$prevnext = "";
			if($i > 1){ $prevnext .= "<a href=\"#".($i-1)."\">previous</a>"; }
			if($i > 1 && $i < $s){ $prevnext .= " | "; }
			if($i < $s){ $prevnext .= "<a href=\"#".($i+1)."\">next</a>"; }
			$prevnext = "<a href=\"#slide-".($i)."\">previous</a> | <a href=\"#".($i+1)."\">next</a>";
			$extra = ($i % 3 == 0) ? " last" : "";
			$slidehtml .= "									<li class=\"slide slide-video one-fourth".($extra)."\" id=\"".($i)."\"><div class=\"pic\"><video id=\"video$i\" width=\"100%\" poster=\"$rest.jpg\"><source src=\"$rest.webm\" type=\"video/webm\" /><source src=\"$rest.mp4\" type=\"video/mp4\" /></video></div><div class=\"timestamp\">Time: <time>$timestamp</time></div></li>\n";
		}
		if($t eq "message"){
			($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($tstart+parse_timestamp($timestamp)+$tzoffset*3600);
			$keep = $timestamp;
			$timestamp = format_times($hour,$min,$sec);
			$messages{$timestamp."_note"} = "<div class=\"bubble bubble-east\"><div class=\"bubble-inner\"><div class=\"timestamp\" data=\"$keep\"><time>$timestamp</time></div> $rest</div></div>";
		}
		if($t eq "end"){
			$end = $timestamp;
		}
	}
}
if($slidehtml){ $slidehtml = "\t\t\t\t\t\t\t\t<ul class=\"speakers\">\n".$slidehtml."\t\t\t\t\t\t\t\t</ul>"; }

if($more){
	@moretalks = split(/,/,$more);
	$more = "				<div class=\"hr\"></div>\n";
	$more .= "				<h2>More talks...</h2>\n";
	$more .= "				<ul class=\"other-speakers\">\n";
	$i = 0;
	foreach $talk (@moretalks){
		open(ALTN,"$talk/setup.txt") || print "Can't open file $talk/setup.txt\n";
		@altlines = <ALTN>;
		close(ALTN);

		$cover = "0";
		foreach $line (@altlines){

			$line =~ s/[\n\r]//g;
			if($line =~ /Title: (.*)$/){
				$alttitle = $1;
			}elsif($line =~ /Fullname: (.*)$/){
				$altname = $1;
			}elsif($line =~ /00:00\tslide\t(.*)$/){
				$cover = $1;
				$cover =~ s/\.([^\.]+)$//;
			}
		}
		$extra = ($i == 3) ? " last" : "";
		$more .= "					<li class=\"one-fourth".$extra."\"><a href=\"../$talk/index.html\"><img src=\"../$talk\/$cover_small.jpg\" alt=\"$alttitle\" title=\"$alttitle\" \/><\/a><div class=\"text\"><p><a href=\"..\/$talk\/index.html\">$alttitle<\/a><br />by $altname<\/p><\/div><\/li>\n";
		$i++;
	}
	$more .= "				</ul>\n";
}	


open(TW,$flag{'tweets'});
@tweets = <TW>;
close(TW);

foreach $tweet (@tweets){
	$tweet =~ s/\\\//\//g;
	if($tweet =~ /"url":"([^\"]*)","expanded_url":"([^\"]*)"/){
		$expander{$1} = $2;
	}
}


foreach $tweet (@tweets){
	$tweet =~ s/[\n\r]//g;
	if($tweet){
		$tweet =~ s/\\\"/&quot;/g;
		$tweet =~ s/\\\\/\//g;
		$tweet =~ s/\\u201[cd]/&quot;/g;
		$tweet =~ s/\\u2026/\&#8230;/g;
		
		if($tweet =~ /\"name\":\"([^\"]*)"/){ $name = $1; }
		if($tweet =~ /\"screen_name\":\"([^\"]*)"/){ $screen_name = $1; }
		if($tweet =~ /"id":(\d+),/){ $statusid = $1; }
		if($tweet =~ /\"profile_image_url\":\"([^\"]*)\"\,/){ $profile_image_url = $1; $profile_image_url =~ s/\\//g; }
		$text = "";
		if($tweet =~ /\"text\":\"([^\"]+)\"/){
			$text = $1;
		}
		if($text =~ /^RT/ && $tweet =~ /\"retweeted_status\"[^\}]+\"text\":\"([^\"]*)\"/){
			$text = $1;
		}
		if($text){
			$text =~ s/RT \@$name//g;
			$text =~ s/\\\//\//g;
			$text =~ s/\\\"/\"/g;
			$text =~ s/(https?:\/\/[^\s]*)/$expander{$1}/g;
			$text =~ s/(https?:\/\/)([^\s]*)/\<a href='$1$2'\>$2\<\/a\>/g;
			$text =~ s/\@([a-zA-Z0-9\_]*)/\@\<a href='http:\/\/twitter.com\/$1'\>$1\<\/a\>/g;
		}
		if($tweet =~ /\"created_at\":\"([^\"]*)"/){ $created_at = parse_datetime($1); }
		($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($created_at+$tzoffset*3600);
		$diff = $created_at-$tstart;
		if($diff > 0){
			$timestamp = format_times($hour,$min,$sec);
			$messages{$timestamp."_tweet"} = "<div class=\"bubble bubble-north\"><div class=\"bubble-inner\"><div class=\"timestamp\" data=\"".format_timestamp($diff)."\"><time>$timestamp<\/time><\/div> ".$text."</div></div><div class=\"tweeter\"><div class=\"profile_image\"><a href=\"http://twitter.com/$screen_name/statuses/$statusid\"><img src=\"".$profile_image_url."\" alt=\"$screen_name\" title=\"$screen_name\" \/></a></div></div>";
		}
	}
}

$n = keys %messages;

if($n > 0){
	$messages = "\t\t\t\t\t\t<ul>\n";
	foreach $key (sort keys %messages){
		($ts,$t) = split(/\_/,$key);
		$messages .= "							<li class=\"$t\">$messages{$key}</li>\n";
	}
	$messages .= "\t\t\t\t\t\t</ul>";
}

$oggsize = sprintf("%0.1f",(-s "$dir/$audio.ogg")/(1024*1024))." MB";
$mp3size = sprintf("%0.1f",(-s "$dir/$audio.mp3")/(1024*1024))." MB";

@pics = split(/ /,$picture);
if(@pics > 1){
	$pic = "";
	for($i = 0; $i < @pics ; $i++){
		$pic .= "<div class=\"avatar\"><img src=\"$pics[$i]\" alt=\"Avatar\" /></div>";
	}
}else{
	$pic = "<div class=\"avatar\"><img src=\"$picture\" alt=\"Avatar\" /></div>";
}

# Build video links
$videolinks = "";
if($youtube){
	$videolinks .= " <a href=\"$youtube\">Youtube</a>";
}
if($vimeo){
	$videolinks .= "<div class=\"vimeobtn\"><img src=\"http://dotastronomy.com/lowe/vimeo.png\" class=\"vimeoicon\"></div> <a href=\"$vimeo\" class=\"vimeo\">Watch on Vimeo</a>";
}


open(HTML,">","$dir/index.html");
foreach $line (@lines){
	$line =~ s/\{\% TITLE \%\}/$title/g;
	$line =~ s/\{\% ROOT \%\}/$root/g;
	$line =~ s/\{\% AUDIO \%\}/$audio/g;
	$line =~ s/\{\% AUDIO_OGG_SIZE \%\}/$oggsize/g;
	$line =~ s/\{\% AUDIO_MP3_SIZE \%\}/$mp3size/g;
	$line =~ s/\{\% PICTURE \%\}/$pic/g;
	$line =~ s/\{\% VIDEOLINKS \%\}/$videolinks/g;
	$line =~ s/\{\% PHOTOGRAPHER \%\}/$photographer/g;
	$line =~ s/\{\% CURATOR \%\}/$curator/g;
	$line =~ s/\{\% FULLNAME \%\}/$fullname/g;
	$line =~ s/\{\% DATE \%\}/$date/g;
	$line =~ s/\{\% TOTAL \%\}/$end/g;
	$line =~ s/\{\% ABOUT \%\}/$about/g;
	$line =~ s/\{\% SLIDES \%\}/$slidehtml/g;
	$line =~ s/\{\% MESSAGES \%\}/$messages/g;
	$line =~ s/\{\% MORE \%\}/$more/g;
	print HTML $line;
}
close(HTML);




################################
# Subroutines

sub parse_timestamp {
	local ($t,$min,$sec,$i);
	($min,$sec) = split(":",$_[0]);
	return (int($min)*60 + int($sec));
}
sub format_times {
	local ($t,$hour,$min,$sec,$i);
	$hour = $_[0];
	$min = $_[1];
	$sec = $_[2];
	return sprintf('%02d:%02d:%02d',$hour,$min,$sec);
}
sub format_timestamp {
	local ($t,$hour,$min,$sec,$i);
	$t = $_[0];
	$min = int(($t)/60);
	$sec = $t - ($min*60);
	return sprintf('%02d:%02d',$min,$sec);
}
sub parse_datetime {
	local ($day,$mon,$mday,$t,$tz,$y,$hour,$min,$sec,@months,$i);
	$d = $_[0];
	if(!$d){
		return time()
	}
	# Mon Jul 09 08:59:33 +0000 2012
	($day,$mon,$mday,$t,$tz,$year) = split(/ /,$d);
	($hour,$min,$sec) = split(/\:/,$t);
	@months = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

	for($i = 0 ; $i < @months ; $i++){
		if($months[$i] eq $mon){ $mon = $i; }
	}
	return timelocal($sec,$min,$hour,$mday,$mon,$year);
}