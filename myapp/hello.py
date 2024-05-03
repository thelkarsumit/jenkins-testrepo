import fire

def hello(name="World"):
  return "Hello dear %s!" % name

if __name__ == '__main__':
  fire.Fire(hello)
