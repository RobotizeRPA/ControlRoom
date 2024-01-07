import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TasksModule } from './tasks/tasks.module';
import { MongooseModule } from '@nestjs/mongoose';
import { config } from 'dotenv';

config()

@Module({
  imports: [MongooseModule.forRootAsync({
    useFactory: () => ({
      uri: process.env.MONGODB
    })
  }),TasksModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
