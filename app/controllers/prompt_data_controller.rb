class PromptDataController < ApplicationController


    def index
        prompts = PromptDatum.all
        render json: prompts
    end
# get 'prompt_data/random', :to => 'prompt_data#random'
    def random
        prompts = PromptDatum.all
        
        num = rand(1...prompts.length)

        render json: prompts[num]
    end
end
e