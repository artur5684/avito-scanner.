
import os
import asyncio
import logging

from aiogram import Bot, Dispatcher
from aiogram.filters import Command
from aiogram.types import Message
from dotenv import load_dotenv

load_dotenv()

TOKEN = os.getenv("BOT_TOKEN")

logging.basicConfig(level=logging.INFO)

bot = Bot(token=TOKEN)
dp = Dispatcher()


@dp.message(Command("start"))
async def start(message: Message):
    await message.answer(
        "🤖 AVITO SCANNER PRO\n\n"
        "Добро пожаловать!\n\n"
        "Доступные команды:\n"
        "/start — запуск бота\n"
        "/help — помощь\n"
        "/status — состояние бота\n"
        "/search — настройка поиска\n\n"
        "Сканнер готов к настройке!"
    )


@dp.message(Command("help"))
async def help_command(message: Message):
    await message.answer(
        "🔎 AVITO SCANNER PRO\n"
        "Здесь будет управление поиском объявлений."
    )


@dp.message(Command("status"))
async def status(message: Message):
    await message.answer("🟢 Telegram-бот работает!")


@dp.message(Command("search"))
async def search(message: Message):
    await message.answer(
        "Для настройки поиска добавим фильтры цены, "
        "города, ключевых слов и состояния товара."
    )


async def main():
    if not TOKEN:
        raise RuntimeError("Не указан BOT_TOKEN в переменных окружения")

    await dp.start_polling(bot)


if __name__ == "__main__":
    asyncio.run(main())
