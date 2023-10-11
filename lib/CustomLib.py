from selenium.webdriver.remote.webelement import WebElement


def get_minimum_price(elements: list[WebElement]) -> int:
    return min([int(price.text.split(' ')[-1]) for price in elements])

def send_by_chunk(input: WebElement, text: str, chunk_size: int):
    for i in range(0, len(text), chunk_size):
        input.send_keys(text[i:i+chunk_size])

def get_sum_prices(elements: list[WebElement]) -> int:
    return sum([int(price.text) for price in elements])
