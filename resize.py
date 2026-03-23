from PIL import Image
import os

src = r'C:\Users\Admin\Downloads'
out = r'C:\Antigravity\AppCy\screenshots'
os.makedirs(out, exist_ok=True)

for i in range(1, 4):
    path = os.path.join(src, f'{i}.jpg')
    print(f'Processing {path}...')
    img = Image.open(path).convert('RGB')
    print(f'  Original: {img.size}')
    
    # iPhone 6.5": 1242x2688
    iphone = img.resize((1242, 2688), Image.BILINEAR)
    iphone.save(os.path.join(out, f'{i}_iphone.jpg'), quality=90)
    print(f'  Saved {i}_iphone.jpg')
    
    # iPad 13": 2048x2732
    ipad = img.resize((2048, 2732), Image.BILINEAR)
    ipad.save(os.path.join(out, f'{i}_ipad.jpg'), quality=90)
    print(f'  Saved {i}_ipad.jpg')

print('DONE!')
