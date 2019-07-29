import cabocha
from cabocha.analyzer import CaboChaAnalyzer
analyzer = CaboChaAnalyzer()
tree = analyzer.parse("日本語の形態素解析はすごいです。")
for chunk in tree:
  for token in chunk:
    print(token)
