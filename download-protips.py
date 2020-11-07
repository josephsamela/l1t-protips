import os
import time

def main():
    for subs in os.listdir('subs'):
        tips = extract_tips(subs)
        for tip in tips:
            try:
                download_tip(tip)
            except:
                continue
    
class Tip:
    def __init__(self, id, timestamp, url):
        self.id = id
        self.timestamp = timestamp
        self.url = url

def download_tip(tip):

    print(f'\n\nDownload {tip.id} at {tip.timestamp} from {tip.url}')
    os.system(f'youtube-dl -f "bestvideo[ext=webm][height<=?1080]+bestaudio" --cookies=cookies.txt --retries 3 --merge-output-format webm -o "clips/{tip.id}.%(ext)s" "{tip.url}"')
    os.system(f'ffmpeg -y -ss {tip.timestamp} -i "clips/{tip.id}.webm" -t 00:00:20.00 -c:v copy -c:a copy tips/{tip.id}.webm')
    os.remove(f'clips/{tip.id}.webm')

def extract_tips(subs):
    tips = []
    with open(f'subs/{subs}') as f:
        for line in f.read().split('\n'):
            if 'tip' in line and 'pro' in line:
                if not '<c>' in line:
                    continue
                else:                   
                    tips.append(
                        Tip(
                            id = time.time(),
                            timestamp = line.split('<c>')[0].split('<')[1].split('>')[0],
                            url = 'https://youtube.com/watch?v=' + subs.split('.en.vtt')[0]
                        )
                    )
    return tips

if __name__ == '__main__':
    main()
