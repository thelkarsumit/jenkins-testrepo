import fire

def hello(name="World"):
  print("this is for PR build")
  return "Hello %s!" % name

if __name__ == '__main__':
  fire.Fire(hello)